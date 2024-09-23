@implementation MAAutoAssetInfoStaged

- (MAAutoAssetInfoStaged)initWithByGroupTotalStagedBytes:(id)a3 withByGroupAssetsSuccessfullyStaged:(id)a4
{
  return -[MAAutoAssetInfoStaged initWithTotalStagedBytes:withAssetsSuccessfullyStaged:withByGroupTotalStagedBytes:withByGroupAssetsSuccessfullyStaged:](self, "initWithTotalStagedBytes:withAssetsSuccessfullyStaged:withByGroupTotalStagedBytes:withByGroupAssetsSuccessfullyStaged:", 0, 0, a3, a4);
}

- (MAAutoAssetInfoStaged)initWithTotalStagedBytes:(int64_t)a3 withAssetsSuccessfullyStaged:(unint64_t)a4
{
  return -[MAAutoAssetInfoStaged initWithTotalStagedBytes:withAssetsSuccessfullyStaged:withByGroupTotalStagedBytes:withByGroupAssetsSuccessfullyStaged:](self, "initWithTotalStagedBytes:withAssetsSuccessfullyStaged:withByGroupTotalStagedBytes:withByGroupAssetsSuccessfullyStaged:", a3, a4, 0, 0);
}

- (MAAutoAssetInfoStaged)initWithTotalStagedBytes:(int64_t)a3 withAssetsSuccessfullyStaged:(unint64_t)a4 withByGroupTotalStagedBytes:(id)a5 withByGroupAssetsSuccessfullyStaged:(id)a6
{
  id v11;
  id v12;
  MAAutoAssetInfoStaged *v13;
  MAAutoAssetInfoStaged *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MAAutoAssetInfoStaged;
  v13 = -[MAAutoAssetInfoStaged init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_totalStagedBytes = a3;
    v13->_assetsSuccessfullyStaged = a4;
    objc_storeStrong((id *)&v13->_byGroupTotalStagedBytes, a5);
    objc_storeStrong((id *)&v14->_byGroupAssetsSuccessfullyStaged, a6);
  }

  return v14;
}

- (MAAutoAssetInfoStaged)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetInfoStaged *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *byGroupTotalStagedBytes;
  uint64_t v11;
  NSDictionary *byGroupAssetsSuccessfullyStaged;
  objc_super v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MAAutoAssetInfoStaged;
  v5 = -[MAAutoAssetInfoStaged init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_totalStagedBytes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalStagedBytes"));
    v5->_assetsSuccessfullyStaged = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("assetsSuccessfullyStaged"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("byGroupTotalStagedBytes"));
    v9 = objc_claimAutoreleasedReturnValue();
    byGroupTotalStagedBytes = v5->_byGroupTotalStagedBytes;
    v5->_byGroupTotalStagedBytes = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("byGroupAssetsSuccessfullyStaged"));
    v11 = objc_claimAutoreleasedReturnValue();
    byGroupAssetsSuccessfullyStaged = v5->_byGroupAssetsSuccessfullyStaged;
    v5->_byGroupAssetsSuccessfullyStaged = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetInfoStaged totalStagedBytes](self, "totalStagedBytes"), CFSTR("totalStagedBytes"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetInfoStaged assetsSuccessfullyStaged](self, "assetsSuccessfullyStaged"), CFSTR("assetsSuccessfullyStaged"));
  -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("byGroupTotalStagedBytes"));

  -[MAAutoAssetInfoStaged byGroupAssetsSuccessfullyStaged](self, "byGroupAssetsSuccessfullyStaged");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("byGroupAssetsSuccessfullyStaged"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  void *v3;
  id v4;
  id v5;
  char v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v19)
    {
      v6 = 1;
      v18 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "safeObjectForKey:ofClass:", v8, objc_opt_class());
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          -[MAAutoAssetInfoStaged byGroupAssetsSuccessfullyStaged](self, "byGroupAssetsSuccessfullyStaged");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "safeObjectForKey:ofClass:", v8, objc_opt_class());
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = v8;
          v14 = CFSTR("REQUIRED");
          if ((objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v13, CFSTR("STAGE_GROUP_REQUIRED")) & 1) != 0
            || (v14 = CFSTR("OPTIONAL"),
                objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v13, CFSTR("STAGE_GROUP_OPTIONAL"))))
          {

            v13 = (__CFString *)v14;
          }
          if ((v6 & 1) == 0)
          {
            objc_msgSend(v4, "appendString:", CFSTR(","));
            objc_msgSend(v5, "appendString:", CFSTR(","));
          }
          objc_msgSend(v4, "appendFormat:", CFSTR("%@:%llu"), v13, objc_msgSend(v10, "unsignedLongLongValue"));
          objc_msgSend(v5, "appendFormat:", CFSTR("%@:%llu"), v13, objc_msgSend(v12, "unsignedLongLongValue"));

          v6 = 0;
        }
        v6 = 0;
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v19);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("staged[BY-GROUP]|byGroupAttributes:%@|byGroupExpectedBytes:%@"), v4, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("staged|totalStagedBytes:%ld|assetsSuccessfullyStaged:%lu"), -[MAAutoAssetInfoStaged totalStagedBytes](self, "totalStagedBytes"), -[MAAutoAssetInfoStaged assetsSuccessfullyStaged](self, "assetsSuccessfullyStaged"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)fullDescription:(id)a3 usingLogger:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  const __CFString *v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v6, CFSTR("MA-AUTO-STAGE(REPLY):DOWNLOAD_GROUPS")) & 1) != 0)
  {
    v8 = CFSTR("DOWNLOAD-GROUPS-REPLY");
  }
  else if (objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v6, CFSTR("MA-AUTO-STAGE(REPLY):DOWNLOAD_ALL")))
  {
    v8 = CFSTR("DOWNLOAD-ALL-REPLY");
  }
  else
  {
    v8 = CFSTR("STAGED");
  }
  objc_msgSend(v7, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138543874;
    v24 = v8;
    v25 = 2048;
    v26 = -[MAAutoAssetInfoStaged totalStagedBytes](self, "totalStagedBytes");
    v27 = 2048;
    v28 = -[MAAutoAssetInfoStaged assetsSuccessfullyStaged](self, "assetsSuccessfullyStaged");
    _os_log_impl(&dword_1AE33B000, v9, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> totalStagedBytes:%llu | assetsSuccessfullyStaged:%llu", (uint8_t *)&v23, 0x20u);
  }

  -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      objc_msgSend(v7, "oslog");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v8;
        v25 = 2114;
        v26 = (int64_t)v15;
        _os_log_impl(&dword_1AE33B000, v14, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupTotalStagedBytes:\n%{public}@", (uint8_t *)&v23, 0x16u);

      }
    }
  }
  -[MAAutoAssetInfoStaged byGroupAssetsSuccessfullyStaged](self, "byGroupAssetsSuccessfullyStaged");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[MAAutoAssetInfoStaged byGroupAssetsSuccessfullyStaged](self, "byGroupAssetsSuccessfullyStaged");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      objc_msgSend(v7, "oslog");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[MAAutoAssetInfoStaged byGroupAssetsSuccessfullyStaged](self, "byGroupAssetsSuccessfullyStaged");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "safeSummary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v8;
        v25 = 2114;
        v26 = (int64_t)v22;
        _os_log_impl(&dword_1AE33B000, v20, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupAssetsSuccessfullyStaged:\n%{public}@", (uint8_t *)&v23, 0x16u);

      }
    }
  }

}

- (int64_t)totalStagedBytes
{
  return self->_totalStagedBytes;
}

- (unint64_t)assetsSuccessfullyStaged
{
  return self->_assetsSuccessfullyStaged;
}

- (NSDictionary)byGroupTotalStagedBytes
{
  return self->_byGroupTotalStagedBytes;
}

- (NSDictionary)byGroupAssetsSuccessfullyStaged
{
  return self->_byGroupAssetsSuccessfullyStaged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byGroupAssetsSuccessfullyStaged, 0);
  objc_storeStrong((id *)&self->_byGroupTotalStagedBytes, 0);
}

@end
