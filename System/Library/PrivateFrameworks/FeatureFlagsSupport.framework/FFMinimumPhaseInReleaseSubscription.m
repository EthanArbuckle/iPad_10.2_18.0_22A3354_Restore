@implementation FFMinimumPhaseInReleaseSubscription

- (FFMinimumPhaseInReleaseSubscription)initWithPhase:(id)a3 targetRelease:(id)a4
{
  id v7;
  id v8;
  id *v9;
  FFMinimumPhaseInReleaseSubscription *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FFMinimumPhaseInReleaseSubscription;
  v9 = -[FFSubscription initPrivate](&v12, sel_initPrivate);
  v10 = (FFMinimumPhaseInReleaseSubscription *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 2, a3);
    objc_storeStrong((id *)&v10->_targetRelease, a4);
  }

  return v10;
}

- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inConfiguration:(id)a5
{
  id v8;
  void *v9;
  BOOL v10;

  v8 = a5;
  objc_msgSend(v8, "stateForFeature:domain:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = -[FFMinimumPhaseInReleaseSubscription matchesFeatureWithState:inConfigurationOfUnknownLockState:](self, "matchesFeatureWithState:inConfigurationOfUnknownLockState:", v9, v8);
  else
    v10 = 0;

  return v10;
}

- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inAlreadyLockedConfiguration:(id)a5
{
  id v8;
  void *v9;
  BOOL v10;

  v8 = a5;
  objc_msgSend(v8, "resolvedStateForFeature:domain:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = -[FFMinimumPhaseInReleaseSubscription matchesFeatureWithState:inConfigurationOfUnknownLockState:](self, "matchesFeatureWithState:inConfigurationOfUnknownLockState:", v9, v8);
  else
    v10 = 0;

  return v10;
}

- (BOOL)matchesFeatureWithState:(id)a3 inConfigurationOfUnknownLockState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  char v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TargetRelease"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (-[FFMinimumPhaseInReleaseSubscription targetRelease](self, "targetRelease"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v10, "isEqualToString:", v11),
        v11,
        v12))
  {
    objc_msgSend(v6, "phase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_msgSend(v7, "sortValueForPhase:", v13);
      -[FFMinimumPhaseInReleaseSubscription minimumPhase](self, "minimumPhase");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v7, "sortValueForPhase:", v15);

      if (v14 && v16)
      {
        v17 = v14 >= v16;
      }
      else
      {
        -[FFMinimumPhaseInReleaseSubscription minimumPhase](self, "minimumPhase");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v13, "isEqualToString:", v18);

      }
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)mergeSubscriptions:(id)a3
{
  id v3;

  v3 = a3;
  abort();
}

- (id)encodeToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("MinimumPhase");
  -[FFMinimumPhaseInReleaseSubscription minimumPhase](self, "minimumPhase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("TargetRelease");
  v8[0] = v3;
  -[FFMinimumPhaseInReleaseSubscription targetRelease](self, "targetRelease");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)decodeFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  FFMinimumPhaseInReleaseSubscription *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinimumPhase"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TargetRelease"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = -[FFMinimumPhaseInReleaseSubscription initWithPhase:targetRelease:]([FFMinimumPhaseInReleaseSubscription alloc], "initWithPhase:targetRelease:", v4, v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)nameOfClass
{
  return CFSTR("FFMinimumPhaseInReleaseSubscription");
}

- (NSString)targetRelease
{
  return self->_targetRelease;
}

- (NSString)minimumPhase
{
  return self->_minimumPhase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumPhase, 0);
  objc_storeStrong((id *)&self->_targetRelease, 0);
}

@end
