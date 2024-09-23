@implementation ATXBlendedLocalAndGlobalScores

+ (id)blendedGlobalAndLocalScoresForGlobalScores:(id)a3 LOITypeLaunches:(id)a4 lastAppLaunches:(id)a5 timeOfDayLaunches:(id)a6 dayOfWeekLaunches:(id)a7 forApps:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[8];
  _QWORD v29[9];

  v29[8] = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  +[ATXDirichletDistribution sharedInstance](ATXDirichletDistribution, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("LOIType");
  objc_msgSend(v17, "getBlendedLocalAndGlobalScoresWithLocalCounts:andGlobalScores:withSamplingEnabled:", v15, v16, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v27;
  v28[1] = CFSTR("LastApp");
  objc_msgSend(v17, "getBlendedLocalAndGlobalScoresWithLocalCounts:andGlobalScores:withSamplingEnabled:", v14, v16, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v18;
  v28[2] = CFSTR("TimeOfDay");
  objc_msgSend(v17, "getBlendedLocalAndGlobalScoresWithLocalCounts:andGlobalScores:withSamplingEnabled:", v13, v16, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v19;
  v28[3] = CFSTR("DayOfWeek");
  objc_msgSend(v17, "getBlendedLocalAndGlobalScoresWithLocalCounts:andGlobalScores:withSamplingEnabled:", v12, v16, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v20;
  v28[4] = CFSTR("LOIType_sampled");
  objc_msgSend(v17, "getBlendedLocalAndGlobalScoresWithLocalCounts:andGlobalScores:withSamplingEnabled:", v15, v16, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v29[4] = v21;
  v28[5] = CFSTR("LastApp_sampled");
  objc_msgSend(v17, "getBlendedLocalAndGlobalScoresWithLocalCounts:andGlobalScores:withSamplingEnabled:", v14, v16, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v29[5] = v22;
  v28[6] = CFSTR("TimeOfDay_sampled");
  objc_msgSend(v17, "getBlendedLocalAndGlobalScoresWithLocalCounts:andGlobalScores:withSamplingEnabled:", v13, v16, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v29[6] = v23;
  v28[7] = CFSTR("DayOfWeek_sampled");
  objc_msgSend(v17, "getBlendedLocalAndGlobalScoresWithLocalCounts:andGlobalScores:withSamplingEnabled:", v12, v16, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v29[7] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

@end
