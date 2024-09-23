@implementation NSString(NavigationDebug)

+ (__CFString)_navigation_stringWithSpeed:()NavigationDebug
{
  __CFString *v1;

  if (a1 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), llround(a1 * 2.23693629));
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = CFSTR("?");
  }
  return v1;
}

+ (const)_navigation_stringWithSpeedUnits
{
  return CFSTR("m/h");
}

+ (__CFString)_navigation_stringWithDirection:()NavigationDebug abbreviated:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  NSObject *v28;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  int v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!qword_1ED0C3EC0)
  {
    v38 = a4;
    v5 = objc_alloc(MEMORY[0x1E0C99D20]);
    _MNLocalizedStringFromThisBundle(CFSTR("North"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("North East"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("East"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("South East"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("South"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("South West"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("West"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("North West"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "initWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, 0);
    v15 = (void *)qword_1ED0C3EC0;
    qword_1ED0C3EC0 = v14;

    v16 = objc_alloc(MEMORY[0x1E0C99D20]);
    _MNLocalizedStringFromThisBundle(CFSTR("N"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("NE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("E"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("SE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("S"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("SW"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("W"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("NW"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v16, "initWithObjects:", v17, v18, v19, v20, v21, v22, v23, v24, 0);
    v26 = (void *)qword_1ED0C3EC8;
    qword_1ED0C3EC8 = v25;

    a4 = v38;
  }
  v27 = a1 + 360.0;
  if (a1 >= 0.0)
    v27 = a1;
  if (v27 >= 0.0)
  {
    v30 = 10;
    if (a4)
      v30 = 11;
    v31 = (void *)_MergedGlobals_21[v30];
    v32 = llround(floor((v27 + 22.5) / 45.0));
    v33 = v32 & 7;
    v35 = -(uint64_t)v32;
    v34 = v35 < 0;
    v36 = v35 & 7;
    if (v34)
      v37 = v33;
    else
      v37 = -v36;
    objc_msgSend(v31, "objectAtIndex:", v37);
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v40 = "+[NSString(NavigationDebug) _navigation_stringWithDirection:abbreviated:]";
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
      v43 = 1024;
      v44 = 2300;
      _os_log_impl(&dword_1B0AD7000, v28, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
    }

    return CFSTR("?");
  }
}

+ (__CFString)_navigation_stringWithAltitude:()NavigationDebug accuracy:
{
  __CFString *v2;
  uint64_t v4;

  if (a2 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), llround(a1 * 3.2808399), v4);
  }
  else
  {
    if (a2 <= 0.0)
    {
      v2 = CFSTR("?");
      return v2;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld ±%ld"), llround(a1 * 3.2808399), llround(a2 * 3.2808399));
  }
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v2;
}

+ (const)_navigation_stringWithAltitudeUnits
{
  return CFSTR("ft");
}

+ (uint64_t)_navigation_stringWithTime:()NavigationDebug
{
  return objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", a3, 0, 1);
}

+ (__CFString)_navigation_pointerDescription:()NavigationDebug
{
  void *v3;
  id v4;
  __CFString *v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = a3;
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("nil");
  }
  return v5;
}

@end
