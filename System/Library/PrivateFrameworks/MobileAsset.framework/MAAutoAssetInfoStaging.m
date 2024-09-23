@implementation MAAutoAssetInfoStaging

- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3 withByGroupAvailableForStaging:(id)a4 withByGroupTotalExpectedBytes:(id)a5
{
  return -[MAAutoAssetInfoStaging initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes:withTotalExpectedBytes:](self, "initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes:withTotalExpectedBytes:", a3, a4, 0, a5, 0);
}

- (MAAutoAssetInfoStaging)initWithByGroupAvailableForStaging:(id)a3 withByGroupTotalExpectedBytes:(id)a4
{
  return -[MAAutoAssetInfoStaging initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes:withTotalExpectedBytes:](self, "initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes:withTotalExpectedBytes:", 0, a3, 0, a4, 0);
}

- (MAAutoAssetInfoStaging)initWithAvailableForStaging:(id)a3 withTotalExpectedBytes:(unint64_t)a4
{
  return -[MAAutoAssetInfoStaging initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes:withTotalExpectedBytes:](self, "initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes:withTotalExpectedBytes:", 0, 0, a3, 0, a4);
}

- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3
{
  return -[MAAutoAssetInfoStaging initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes:withTotalExpectedBytes:](self, "initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes:withTotalExpectedBytes:", a3, 0, 0, 0, 0);
}

- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3 withByGroupAvailableForStaging:(id)a4 withAvailableForStaging:(id)a5 withByGroupTotalExpectedBytes:(id)a6 withTotalExpectedBytes:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MAAutoAssetInfoStaging *v17;
  MAAutoAssetInfoStaging *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetInfoStaging;
  v17 = -[MAAutoAssetInfoStaging init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_updateAttributes, a3);
    objc_storeStrong((id *)&v18->_byGroupAvailableForStagingAttributes, a4);
    objc_storeStrong((id *)&v18->_allAvailableForStagingAttributes, a5);
    objc_storeStrong((id *)&v18->_byGroupTotalExpectedBytes, a6);
    v18->_totalExpectedBytes = a7;
  }

  return v18;
}

- (MAAutoAssetInfoStaging)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetInfoStaging *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *updateAttributes;
  uint64_t v17;
  NSDictionary *byGroupAvailableForStagingAttributes;
  uint64_t v19;
  NSDictionary *allAvailableForStagingAttributes;
  uint64_t v21;
  NSDictionary *byGroupTotalExpectedBytes;
  objc_super v24;
  _QWORD v25[5];
  _QWORD v26[9];
  _QWORD v27[5];

  v27[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MAAutoAssetInfoStaging;
  v5 = -[MAAutoAssetInfoStaging init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    v26[3] = objc_opt_class();
    v26[4] = objc_opt_class();
    v26[5] = objc_opt_class();
    v26[6] = objc_opt_class();
    v26[7] = objc_opt_class();
    v26[8] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    v25[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("updateAttributes"));
    v15 = objc_claimAutoreleasedReturnValue();
    updateAttributes = v5->_updateAttributes;
    v5->_updateAttributes = (NSDictionary *)v15;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("byGroupAvailableForStagingAttributes"));
    v17 = objc_claimAutoreleasedReturnValue();
    byGroupAvailableForStagingAttributes = v5->_byGroupAvailableForStagingAttributes;
    v5->_byGroupAvailableForStagingAttributes = (NSDictionary *)v17;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("allAvailableForStagingAttributes"));
    v19 = objc_claimAutoreleasedReturnValue();
    allAvailableForStagingAttributes = v5->_allAvailableForStagingAttributes;
    v5->_allAvailableForStagingAttributes = (NSDictionary *)v19;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("byGroupTotalExpectedBytes"));
    v21 = objc_claimAutoreleasedReturnValue();
    byGroupTotalExpectedBytes = v5->_byGroupTotalExpectedBytes;
    v5->_byGroupTotalExpectedBytes = (NSDictionary *)v21;

    v5->_totalExpectedBytes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalExpectedBytes"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("updateAttributes"));

  -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("byGroupAvailableForStagingAttributes"));

  -[MAAutoAssetInfoStaging allAvailableForStagingAttributes](self, "allAvailableForStagingAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("allAvailableForStagingAttributes"));

  -[MAAutoAssetInfoStaging byGroupTotalExpectedBytes](self, "byGroupTotalExpectedBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("byGroupTotalExpectedBytes"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[MAAutoAssetInfoStaging totalExpectedBytes](self, "totalExpectedBytes"), CFSTR("totalExpectedBytes"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetInfoStaging summary](self, "summary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99D80];
    -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeSummaryForDictionary:");
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = CFSTR("N");
  }
  -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99D80];
    -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeSummaryForDictionary:");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("N");
  }
  -[MAAutoAssetInfoStaging allAvailableForStagingAttributes](self, "allAvailableForStagingAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99D80];
    -[MAAutoAssetInfoStaging allAvailableForStagingAttributes](self, "allAvailableForStagingAttributes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeSummaryForDictionary:", v2);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("N");
  }
  -[MAAutoAssetInfoStaging byGroupTotalExpectedBytes](self, "byGroupTotalExpectedBytes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0C99D80];
    -[MAAutoAssetInfoStaging byGroupTotalExpectedBytes](self, "byGroupTotalExpectedBytes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeSummaryForDictionary:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@|updateAttributes:%@|byGroupAvailableForStaging:%@|allAvailableForStaging:%@|byGroupTotalExpectedBytes:%@"), v22, v21, v8, v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@|updateAttributes:%@|byGroupAvailableForStaging:%@|allAvailableForStaging:%@|byGroupTotalExpectedBytes:%@"), v22, v21, v8, v11, CFSTR("N"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v9)
  {

  }
  if (v6)
  {

  }
  if (v4)
  {

  }
  return v16;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeObjectForKey:ofClass:", CFSTR("OSVersion"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("Build"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeObjectForKey:ofClass:", CFSTR("TrainName"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeObjectForKey:ofClass:", CFSTR("RestoreVersion"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeObjectForKey:ofClass:", CFSTR("GroupNames"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v12;
  if (v12)
  {
    v30 = v10;
    v31 = v8;
    v32 = v6;
    v33 = v4;
    v13 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v14 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v12;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 1;
      v36 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v38 != v36)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "safeObjectForKey:ofClass:", v19, objc_opt_class());
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[MAAutoAssetInfoStaging byGroupTotalExpectedBytes](self, "byGroupTotalExpectedBytes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "safeObjectForKey:ofClass:", v19, objc_opt_class());
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v19;
          v25 = CFSTR("REQUIRED");
          if ((objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v24, CFSTR("STAGE_GROUP_REQUIRED")) & 1) != 0
            || (v25 = CFSTR("OPTIONAL"),
                objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v24, CFSTR("STAGE_GROUP_OPTIONAL"))))
          {

            v24 = (__CFString *)v25;
          }
          if ((v17 & 1) == 0)
          {
            objc_msgSend(v13, "appendString:", CFSTR(","));
            objc_msgSend(v14, "appendString:", CFSTR(","));
          }
          objc_msgSend(v13, "appendFormat:", CFSTR("%@:%ld"), v24, objc_msgSend(v21, "count"));
          objc_msgSend(v14, "appendFormat:", CFSTR("%@:%llu"), v24, objc_msgSend(v23, "unsignedLongLongValue"));

          v17 = 0;
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        v17 = 0;
      }
      while (v16);
    }

    v10 = v30;
    v8 = v31;
    v6 = v32;
    v4 = v33;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("staging[BY-GROUP]|osVersion:%@|build:%@|trainName:%@|restoreVersion:%@|byGroupAttributes:%@|byGroupExpectedBytes:%@"), v33, v32, v31, v30, v13, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    -[MAAutoAssetInfoStaging allAvailableForStagingAttributes](self, "allAvailableForStagingAttributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("staging[ALL]|osVersion:%@|build:%@|trainName:%@|restoreVersion:%@|allAvailableForStaging:%ld|totalExpectedBytes:%llu"), v4, v6, v8, v10, objc_msgSend(v28, "count"), -[MAAutoAssetInfoStaging totalExpectedBytes](self, "totalExpectedBytes"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v26;
}

- (void)fullDescription:(id)a3 usingLogger:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  unint64_t v29;
  int v30;
  const __CFString *v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v6, CFSTR("MA-AUTO-STAGE:DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE")) & 1) != 0)
  {
    v8 = CFSTR("DETERMINE-GROUPS-REQUEST");
  }
  else if ((objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v6, CFSTR("MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE_FOR_UPDATE")) & 1) != 0)
  {
    v8 = CFSTR("DETERMINE-ALL-REQUEST");
  }
  else if ((objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v6, CFSTR("MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE")) & 1) != 0)
  {
    v8 = CFSTR("DETERMINE-ALL-LEGACY-REQUEST");
  }
  else if ((objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v6, CFSTR("MA-AUTO-STAGE:DOWNLOAD_GROUPS")) & 1) != 0)
  {
    v8 = CFSTR("DOWNLOAD-GROUPS-REQUEST");
  }
  else if ((objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v6, CFSTR("MA-AUTO-STAGE:DOWNLOAD_ALL")) & 1) != 0)
  {
    v8 = CFSTR("DOWNLOAD-ALL-REQUEST");
  }
  else if ((objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v6, CFSTR("MA-AUTO-STAGE(REPLY):DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE")) & 1) != 0)
  {
    v8 = CFSTR("DETERMINE-GROUPS-REPLY");
  }
  else if ((objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v6, CFSTR("MA-AUTO-STAGE(REPLY):DETERMINE_ALL_AVAILABLE_FOR_UPDATE")) & 1) != 0)
  {
    v8 = CFSTR("DETERMINE-ALL-REPLY");
  }
  else if (objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v6, CFSTR("MA-AUTO-STAGE(REPLY):DETERMINE_ALL_AVAILABLE")))
  {
    v8 = CFSTR("DETERMINE-ALL-LEGACY-REPLY");
  }
  else
  {
    v8 = CFSTR("STAGING");
  }
  -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v8;
      v32 = 2114;
      v33 = (unint64_t)v11;
      _os_log_impl(&dword_1AE33B000, v10, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> updateAttributes:\n%{public}@", (uint8_t *)&v30, 0x16u);

    }
  }
  -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeObjectForKey:ofClass:", CFSTR("STAGE_GROUP_REQUIRED"), objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safeObjectForKey:ofClass:", CFSTR("STAGE_GROUP_OPTIONAL"), objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && objc_msgSend(v14, "count"))
    {
      objc_msgSend(v7, "oslog");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "safeSummary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v8;
        v32 = 2114;
        v33 = (unint64_t)v18;
        _os_log_impl(&dword_1AE33B000, v17, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupAvailableForStaging[REQUIRED]:\n%{public}@", (uint8_t *)&v30, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v7, "oslog");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 138543362;
        v31 = v8;
        _os_log_impl(&dword_1AE33B000, v17, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupAvailableForStaging[REQUIRED]:NONE", (uint8_t *)&v30, 0xCu);
      }
    }

    if (v16 && objc_msgSend(v16, "count"))
    {
      objc_msgSend(v7, "oslog");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "safeSummary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v8;
        v32 = 2114;
        v33 = (unint64_t)v20;
        _os_log_impl(&dword_1AE33B000, v19, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupAvailableForStaging[OPTIONAL]:\n%{public}@", (uint8_t *)&v30, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v7, "oslog");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 138543362;
        v31 = v8;
        _os_log_impl(&dword_1AE33B000, v19, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupAvailableForStaging[OPTIONAL]:NONE", (uint8_t *)&v30, 0xCu);
      }
    }

  }
  -[MAAutoAssetInfoStaging allAvailableForStagingAttributes](self, "allAvailableForStagingAttributes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v7, "oslog");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[MAAutoAssetInfoStaging allAvailableForStagingAttributes](self, "allAvailableForStagingAttributes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "safeSummary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v8;
      v32 = 2114;
      v33 = (unint64_t)v24;
      _os_log_impl(&dword_1AE33B000, v22, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> allAvailableForStagingAttributes:\n%{public}@", (uint8_t *)&v30, 0x16u);

    }
  }
  -[MAAutoAssetInfoStaging byGroupTotalExpectedBytes](self, "byGroupTotalExpectedBytes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v7, "oslog");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[MAAutoAssetInfoStaging byGroupTotalExpectedBytes](self, "byGroupTotalExpectedBytes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v8;
      v32 = 2114;
      v33 = (unint64_t)v27;
      _os_log_impl(&dword_1AE33B000, v26, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupTotalExpectedBytes:\n%{public}@", (uint8_t *)&v30, 0x16u);

    }
  }
  objc_msgSend(v7, "oslog");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = -[MAAutoAssetInfoStaging totalExpectedBytes](self, "totalExpectedBytes");
    v30 = 138543618;
    v31 = v8;
    v32 = 2048;
    v33 = v29;
    _os_log_impl(&dword_1AE33B000, v28, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> totalExpectedBytes:%llu", (uint8_t *)&v30, 0x16u);
  }

}

- (NSDictionary)updateAttributes
{
  return self->_updateAttributes;
}

- (NSDictionary)byGroupAvailableForStagingAttributes
{
  return self->_byGroupAvailableForStagingAttributes;
}

- (NSDictionary)allAvailableForStagingAttributes
{
  return self->_allAvailableForStagingAttributes;
}

- (NSDictionary)byGroupTotalExpectedBytes
{
  return self->_byGroupTotalExpectedBytes;
}

- (unint64_t)totalExpectedBytes
{
  return self->_totalExpectedBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byGroupTotalExpectedBytes, 0);
  objc_storeStrong((id *)&self->_allAvailableForStagingAttributes, 0);
  objc_storeStrong((id *)&self->_byGroupAvailableForStagingAttributes, 0);
  objc_storeStrong((id *)&self->_updateAttributes, 0);
}

@end
