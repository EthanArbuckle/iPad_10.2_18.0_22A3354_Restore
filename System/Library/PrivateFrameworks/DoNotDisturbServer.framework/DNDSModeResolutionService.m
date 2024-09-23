@implementation DNDSModeResolutionService

- (id)recalculateModeForSnapshot:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "assertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v3, "assertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v3, "activeAssertionUUIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "containsObject:", v14);

          if (v15
            && -[DNDSModeResolutionService _preferModeAssertion:toModeAssertion:](self, "_preferModeAssertion:toModeAssertion:", v12, v9))
          {
            v16 = v12;

            v9 = v16;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v9, "details");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "modeIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)_preferModeAssertion:(id)a3 toModeAssertion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = -[DNDSModeResolutionService _priorityForModeAssertion:](self, "_priorityForModeAssertion:", v7);
  else
    v8 = 0;
  v9 = -[DNDSModeResolutionService _priorityForModeAssertion:](self, "_priorityForModeAssertion:", v6);
  if (v9 <= v8)
  {
    if (v9 == v8)
    {
      objc_msgSend(v7, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "compare:", v12) == -1;

    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (unint64_t)_priorityForModeAssertion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  unint64_t v16;

  v3 = a3;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "modeIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("*");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  if (_intersect_clientIdentifier_modeIdentifier_priority_onceToken != -1)
    dispatch_once(&_intersect_clientIdentifier_modeIdentifier_priority_onceToken, &__block_literal_global_31);
  v11 = (id)_intersect_clientIdentifier_modeIdentifier_priority_dict;
  v12 = v5;
  v13 = v12;
  if (-[__CFString hasSuffix:](v12, "hasSuffix:", CFSTR(".private.schedule")))
  {
    v13 = CFSTR("com.apple.donotdisturb.private.schedule");

  }
  if (-[__CFString containsString:](v12, "containsString:", CFSTR(".private.region.")))
  {

    v13 = CFSTR("com.apple.donotdisturb.private.region");
  }
  objc_msgSend(v11, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("*"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "objectForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("*"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  return v16;
}

@end
