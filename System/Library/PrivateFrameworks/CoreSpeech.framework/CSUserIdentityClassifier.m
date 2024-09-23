@implementation CSUserIdentityClassifier

+ (id)pickTopScoringProfileIdFromScores:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (!v4)
    goto LABEL_11;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v17;
  v8 = -1000;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      objc_msgSend(v3, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      if (v12 > v8)
      {
        v13 = v10;

        v8 = v12;
        v6 = v13;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  }
  while (v5);
  if (!v6)
  {
LABEL_11:
    v14 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CSUserIdentityClassifier pickTopScoringProfileIdFromScores:]";
      v22 = 2114;
      v23 = v3;
      _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s ERR: topScoringUser is nil from %{public}@", buf, 0x16u);
    }
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)classifyUserIdentityFor:(id)a3 withScores:(id)a4 lowScoreThreshold:(int64_t)a5 highScoreThreshold:(int64_t)a6 confidentThreshold:(int64_t)a7 scoreDiffThreshold:(int64_t)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = v14;
  if (v13
    && v14
    && (objc_msgSend(v14, "objectForKeyedSubscript:", v13),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v16))
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

    if (objc_msgSend(v15, "count") == 1)
    {
      v19 = 4;
      v20 = 3;
      if (v18 <= a6)
        v20 = 1;
      if (v18 < a7)
        v19 = v20;
      if (v18 > a5)
        v21 = v19;
      else
        v21 = 0;
    }
    else
    {
      v24 = (void *)objc_msgSend(v15, "mutableCopy");
      objc_msgSend(v24, "removeObjectForKey:", v13);
      +[CSUserIdentityClassifier pickTopScoringProfileIdFromScores:](CSUserIdentityClassifier, "pickTopScoringProfileIdFromScores:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "integerValue");

      if (v18 <= a5)
      {
        v21 = 0;
      }
      else if (v18 - v26 <= a8)
      {
        v21 = 2;
      }
      else if (v18 >= a7)
      {
        v21 = 4;
      }
      else if (v18 <= a6)
      {
        v21 = 1;
      }
      else
      {
        v21 = 3;
      }

    }
  }
  else
  {
    v22 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "+[CSUserIdentityClassifier classifyUserIdentityFor:withScores:lowScoreThreshold:highScoreThreshold:confident"
            "Threshold:scoreDiffThreshold:]";
      v30 = 2114;
      v31 = v13;
      v32 = 2114;
      v33 = v15;
      _os_log_error_impl(&dword_1C2614000, v22, OS_LOG_TYPE_ERROR, "%s ERR: invalid arguments passed %{public}@ %{public}@", buf, 0x20u);
    }
    v21 = 0;
  }

  return v21;
}

+ (unint64_t)classifyUserIdentityFor:(id)a3 withScores:(id)a4 withAsset:(id)a5 withPhId:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_msgSend(v9, "multiUserLowScoreThresholdForPhId:", a6);
  v13 = objc_msgSend(v9, "multiUserHighScoreThresholdForPhId:", a6);
  v14 = objc_msgSend(v9, "multiUserConfidentScoreThresholdForPhId:", a6);
  v15 = objc_msgSend(v9, "multiUserDeltaScoreThresholdForPhId:", a6);

  v16 = +[CSUserIdentityClassifier classifyUserIdentityFor:withScores:lowScoreThreshold:highScoreThreshold:confidentThreshold:scoreDiffThreshold:](CSUserIdentityClassifier, "classifyUserIdentityFor:withScores:lowScoreThreshold:highScoreThreshold:confidentThreshold:scoreDiffThreshold:", v11, v10, v12, v13, v14, v15);
  return v16;
}

+ (id)stringFromClassificationCategory:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (a3 < 5)
    return off_1E7C23DB0[a3];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "+[CSUserIdentityClassifier stringFromClassificationCategory:]";
    v8 = 1026;
    v9 = v3;
    _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s ERR: Incorrect category %{public}d passed", (uint8_t *)&v6, 0x12u);
  }
  return CFSTR("Unknown");
}

@end
