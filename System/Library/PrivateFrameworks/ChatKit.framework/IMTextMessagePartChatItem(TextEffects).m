@implementation IMTextMessagePartChatItem(TextEffects)

- (double)ageForTextEffectCoordination
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(a1, "time");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageSummaryInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D383A8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;

        v2 = v6;
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v2);
  v9 = v8;

  return v9;
}

- (BOOL)isRecentForTextEffectCoordinationWithinTimeInterval:()TextEffects
{
  double v3;

  objc_msgSend(a1, "ageForTextEffectCoordination");
  return v3 > 1.0 && v3 < a2;
}

@end
