@implementation ATXModeFaceComplicationUtilities

+ (double)complicationScoreForAppLaunch:(id)a3 environment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v6, "appLaunchCounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "rawLaunchCount"))
    {
      v9 = (100.0 - (double)(unint64_t)objc_msgSend(v8, "rawLaunchCount")) / 100.0;
      if (v9 < 0.0)
        v9 = 0.0;
      if (v9 >= 1.0)
        v10 = 0.0;
      else
        v10 = 1.0 - v9;
    }
    else
    {
      v10 = 0.0;
    }

  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

@end
