@implementation FICelebrationAssetURLProvider

+ (id)celebrationMovieURLForGoalType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "_movieNameForGoalType:variantNumber:", a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FIAssetsBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_celebrationMovieSubdirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:subdirectory:", v4, CFSTR("mov"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)celebrationMovieURLForAchievementIdentifer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_movieNameForAchievementIdentifier:variantNumber:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  FIAssetsBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_celebrationMovieSubdirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:subdirectory:", v5, CFSTR("mov"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unint64_t)_variantCountForGoalType:(int64_t)a3
{
  return 1;
}

+ (id)_movieNameForGoalType:(int64_t)a3 variantNumber:(unint64_t)a4
{
  __CFString *v4;

  if ((unint64_t)(a3 - 1) > 3)
    v4 = 0;
  else
    v4 = off_24CC4E758[a3 - 1];
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("goal_complete_%@_%lu"), v4, a4);
}

+ (id)_movieNameForAchievementIdentifier:(id)a3 variantNumber:(unint64_t)a4
{
  id v5;
  __CFString *v6;
  void *v7;

  v5 = a3;
  v6 = CFSTR("MonthlyChallenge");
  if ((objc_msgSend(v5, "containsString:", CFSTR("MonthlyChallenge")) & 1) == 0)
  {
    v6 = CFSTR("FirstWorkout");
    if ((objc_msgSend(v5, "containsString:", CFSTR("FirstWorkout")) & 1) == 0)
    {
      v6 = CFSTR("BestWorkout");
      if ((objc_msgSend(v5, "containsString:", CFSTR("BestWorkout")) & 1) == 0)
      {
        v6 = CFSTR("MoveGoals");
        if ((objc_msgSend(v5, "containsString:", CFSTR("MoveGoals")) & 1) == 0)
          v6 = (__CFString *)v5;
      }
    }
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("achievement_earned_%@_%lu"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_celebrationMovieSubdirectory
{
  return CFSTR("PhoneGoalCompletionMovies");
}

@end
