@implementation ICInlineDrawingDefaults

+ (void)updateTouchPredictionPointsFromOverride
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", *MEMORY[0x1E0D643F8]);

  if (v3 < 0)
  {
    if (!MGGetBoolAnswer())
      return;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D643F0];
    v7 = v4;
    v6 = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D643F0];
    v7 = v4;
    v6 = v3;
  }
  objc_msgSend(v4, "setInteger:forKey:", v6, v5);

}

@end
