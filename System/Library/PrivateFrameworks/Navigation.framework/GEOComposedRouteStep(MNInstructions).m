@implementation GEOComposedRouteStep(MNInstructions)

- (id)contentsForContext:()MNInstructions
{
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "composedRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "legIndexForStepIndex:", objc_msgSend(a1, "stepIndex"));
  objc_msgSend(v5, "legs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 < v8)
  {
    objc_msgSend(v5, "legs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSObject destination](v10, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "transportType") == 1)
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 136315650;
        v17 = "-[GEOComposedRouteStep(MNInstructions) contentsForContext:]";
        v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNInstructions.m";
        v20 = 1024;
        v21 = 398;
LABEL_11:
        _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v16, 0x1Cu);
      }
    }
    else
    {
      if (objc_msgSend(a1, "transportType") != 6)
      {
        if (a3 == 1 || a3 == 3)
        {
          +[MNSignInstructionContents contentsWithStep:destination:](MNSignInstructionContents, "contentsWithStep:destination:", a1, v11);
          v15 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (a3 != 2)
          {
            GEOFindOrCreateLog();
            v12 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              goto LABEL_12;
            v16 = 136315650;
            v17 = "-[GEOComposedRouteStep(MNInstructions) contentsForContext:]";
            v18 = 2080;
            v19 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNInstructions.m";
            v20 = 1024;
            v21 = 419;
            goto LABEL_11;
          }
          +[MNListInstructionContents contentsWithStep:](MNListInstructionContents, "contentsWithStep:", a1);
          v15 = objc_claimAutoreleasedReturnValue();
        }
        v13 = (void *)v15;
        goto LABEL_13;
      }
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 136315650;
        v17 = "-[GEOComposedRouteStep(MNInstructions) contentsForContext:]";
        v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNInstructions.m";
        v20 = 1024;
        v21 = 404;
        goto LABEL_11;
      }
    }
LABEL_12:

    v13 = 0;
LABEL_13:

    goto LABEL_14;
  }
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v16 = 136315650;
    v17 = "-[GEOComposedRouteStep(MNInstructions) contentsForContext:]";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNInstructions.m";
    v20 = 1024;
    v21 = 389;
    _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v16, 0x1Cu);
  }
  v13 = 0;
LABEL_14:

  return v13;
}

@end
