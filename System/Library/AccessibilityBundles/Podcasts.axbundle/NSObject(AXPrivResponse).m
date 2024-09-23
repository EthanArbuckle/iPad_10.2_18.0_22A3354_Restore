@implementation NSObject(AXPrivResponse)

+ (id)_accessibilitySeekButtonStringInDirection:()AXPrivResponse response:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  __CFString *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  double v22;
  void *v23;
  void *v24;

  v5 = a4;
  objc_msgSend(v5, "safeValueForKey:", CFSTR("tracklist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("playingItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safeValueForKey:", CFSTR("seekCommand"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!a3)
  {
    objc_msgSend(v9, "safeArrayForKey:", CFSTR("preferredBackwardJumpIntervals"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v11, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      v16 = v22;

      v17 = (void *)MEMORY[0x24BDD17C8];
      v18 = CFSTR("rewind.button");
      goto LABEL_6;
    }
LABEL_7:
    v24 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v9, "safeArrayForKey:", CFSTR("preferredForwardJumpIntervals"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = objc_opt_isKindOfClass();

  if ((v13 & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v11, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v17 = (void *)MEMORY[0x24BDD17C8];
  v18 = CFSTR("ff.button");
LABEL_6:
  accessibilityLocalizedString(v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringWithFormat:", v23, fabs(v16));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v24;
}

+ (id)_accessibilityPlayPauseButtonString:()AXPrivResponse
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("state"));
  objc_msgSend(v3, "safeValueForKey:", CFSTR("tracklist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("playingItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "duration", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  if (v4 == 2)
    v8 = CFSTR("AX_Pause");
  else
    v8 = CFSTR("AX_Play");
  accessibilityLocalizedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
