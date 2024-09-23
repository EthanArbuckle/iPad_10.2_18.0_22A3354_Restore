@implementation NSObject(AXPrivResponse)

+ (BOOL)accessibilityIsFavoriteEnabledForResponse:()AXPrivResponse
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("tracklist.playingItem.likeCommand"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("tracklist.playingItem.dislikeCommand"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

+ (double)_accessibilitySkipIntervalInDirection:()AXPrivResponse forResponse:
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  objc_msgSend(a4, "safeValueForKeyPath:", CFSTR("tracklist.playingItem.seekCommand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 1)
    v7 = CFSTR("preferredForwardJumpIntervals");
  else
    v7 = CFSTR("preferredBackwardJumpIntervals");
  objc_msgSend(v5, "safeArrayForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

+ (uint64_t)accessibilityIsSeekEnabledInDirection:()AXPrivResponse forResponse:
{
  id v4;
  uint64_t v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a4;
  objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("tracklist.playingItem.seekCommand"));
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  AXPerformSafeBlock();
  v5 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v5;
}

+ (id)accessibilitySeekButtonStringInDirection:()AXPrivResponse response:
{
  void *v4;
  double v5;
  double v6;
  __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BEDCDF0], "_accessibilitySkipIntervalInDirection:forResponse:");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v6 = fabs(v5);
  if (a3 == 1)
    v7 = CFSTR("ff.button");
  else
    v7 = CFSTR("rewind.button");
  accessibilityMusicLocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v8, *(_QWORD *)&v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)accessibilityPlayPauseStopButtonString:()AXPrivResponse
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("state"));
  objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("tracklist.playingItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v6, "duration", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  if (v4 == 2)
    v7 = CFSTR("AX_Pause");
  else
    v7 = CFSTR("AX_Play");
  accessibilityMusicLocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
