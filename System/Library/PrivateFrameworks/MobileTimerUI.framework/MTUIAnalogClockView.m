@implementation MTUIAnalogClockView

+ (Class)classForStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)__classMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

+ (void)initialize
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    *(__int128 *)((char *)&xmmword_253D8BF58 + 8) = 0u;
    *(__int128 *)((char *)&xmmword_253D8BF78 + 8) = 0u;
    *(__int128 *)((char *)&xmmword_253D8BF98 + 8) = 0u;
    unk_253D8BF90 = 0u;
    unk_253D8BF70 = 0u;
    unk_253D8BF50 = 0u;
    *(__int128 *)((char *)&__transformCache + 8) = 0u;
    *(_QWORD *)&__transformCache = 0x3FF0000000000000;
    *((_QWORD *)&xmmword_253D8BF58 + 1) = 0x3FF0000000000000;
    qword_253D8BF88 = 0x3FF0000000000000;
    qword_253D8BFB0 = 0x3FF0000000000000;
    __sweepUpdateInterval = 0x47EFFFFFE0000000;
    __sweepCoarseUpdateInterval = 0x47EFFFFFE0000000;
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = (void *)__classMap;
    __classMap = (uint64_t)v3;

    objc_msgSend((id)__classMap, "setObject:forKeyedSubscript:", objc_opt_class(), &unk_24F019650);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cacheTopLevelPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "cacheVersionHash");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v14, "length", (_QWORD)v16))
            {
              if ((objc_msgSend(v14, "isEqualToString:", v8) & 1) == 0)
              {
                objc_msgSend(v6, "stringByAppendingPathComponent:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "removeItemAtPath:error:", v15, 0);

              }
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v11);
      }

    }
  }
}

+ (id)cacheTopLevelPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "userLibraryDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Caches"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cacheVersionedPath
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "cacheTopLevelPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cacheVersionHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)cacheVersionHash
{
  void *v2;
  __CFString *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)cacheVersionHash___cacheDirectoryHash;
  if (!cacheVersionHash___cacheDirectoryHash)
  {
    v3 = (__CFString *)MGCopyAnswer();
    if (!-[__CFString length](v3, "length"))
    {

      v3 = CFSTR("1A001a");
    }
    objc_msgSend(CFSTR("MobileTimerCache"), "stringByAppendingString:", v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "cStringUsingEncoding:", 4);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, objc_msgSend(v4, "length"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CC_SHA1((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), md);
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 40);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)cacheVersionHash___cacheDirectoryHash;
    cacheVersionHash___cacheDirectoryHash = v7;

    for (i = 0; i != 20; ++i)
      objc_msgSend((id)cacheVersionHash___cacheDirectoryHash, "appendFormat:", CFSTR("%02x"), md[i]);

    v2 = (void *)cacheVersionHash___cacheDirectoryHash;
  }
  return v2;
}

+ (void)updateTimeForAllTicking
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x22E2A157C](a1, a2);
  objc_msgSend((id)__flutterClocks, "removeAllObjects");
  objc_msgSend((id)__tickingClocks, "enumerateObjectsUsingBlock:", &__block_literal_global_3);
  objc_msgSend((id)__flutterTimer, "invalidate");
  v3 = (void *)__flutterTimer;
  __flutterTimer = 0;

  if (objc_msgSend((id)__flutterClocks, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF40]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v4, objc_opt_class(), sel_updateFlutterForAllTicking, 0, 1, 0.0333333333);
    v6 = (void *)__flutterTimer;
    __flutterTimer = v5;

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTimer:forMode:", __flutterTimer, *MEMORY[0x24BDBCA90]);

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTimer:forMode:", __flutterTimer, *MEMORY[0x24BDF7F78]);

  }
  objc_autoreleasePoolPop(v2);
}

void __46__MTUIAnalogClockView_updateTimeForAllTicking__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "updateTime");
  if (objc_msgSend(v2, "runMode") == 1)
    objc_msgSend((id)__flutterClocks, "addObject:", v2);

}

+ (void)updateFlutterForAllTicking
{
  void *v2;

  v2 = (void *)MEMORY[0x22E2A157C](a1, a2);
  objc_msgSend((id)__flutterClocks, "enumerateObjectsUsingBlock:", &__block_literal_global_67);
  objc_autoreleasePoolPop(v2);
}

uint64_t __49__MTUIAnalogClockView_updateFlutterForAllTicking__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateFlutter");
}

+ (void)updateTimeForAllSweeping
{
  id v2;
  double v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  long double v14;
  long double v15;
  float v16;
  __float2 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  long double __y;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(v2, "timeIntervalSinceDate:", __lastCoarseSweepUpdateTime);
  if (v3 > 0.0 && v3 < *(double *)&__sweepCoarseUpdateInterval)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "components:fromDate:", 192, v2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (double)objc_msgSend(v11, "second");
    v13 = objc_msgSend(v11, "minute");
    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
    v15 = modf(v14, &__y);
    v16 = fmod((v15 + v12) * 0.104719755, 6.28318531);
    v17 = __sincosf_stret(v16);
    *(double *)&__transformCache = v17.__cosval;
    *((double *)&__transformCache + 1) = v17.__sinval;
    *(double *)&xmmword_253D8BF58 = (float)-v17.__sinval;
    *((double *)&xmmword_253D8BF58 + 1) = v17.__cosval;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = (id)__sweepingClocks;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22++), "updateTimeContinuously:", v13);
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v20);
    }

  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = (id)__sweepingClocks;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9++), "updateTime", (_QWORD)v23);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v7);
    }

    objc_storeStrong((id *)&__lastCoarseSweepUpdateTime, v2);
  }

}

+ (BOOL)isClockRegistered:(id)a3
{
  id v3;
  unint64_t v4;
  char v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "runMode");
  if (v4 > 2)
    v5 = 0;
  else
    v5 = objc_msgSend((id)*off_24F0149B8[v4], "containsObject:", v3);

  return v5;
}

+ (void)registerClock:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "runMode");
  if (v4 >= 2)
  {
    if (v4 == 2)
      objc_msgSend(a1, "registerSweepingClock:", v5);
  }
  else
  {
    objc_msgSend(a1, "registerTickingClock:", v5);
  }

}

+ (void)registerTickingClock:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  v4 = (void *)__tickingClocks;
  v15 = v3;
  if (!__tickingClocks)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v6 = (void *)__tickingClocks;
    __tickingClocks = (uint64_t)v5;

    v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v8 = (void *)__flutterClocks;
    __flutterClocks = (uint64_t)v7;

    v3 = v15;
    v4 = (void *)__tickingClocks;
  }
  objc_msgSend(v4, "addObject:", v3);
  if (!__tickTimer)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCF40]);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithFireDate:interval:target:selector:userInfo:repeats:", v10, objc_opt_class(), sel_updateTimeForAllTicking, 0, 1, 1.0);
    v12 = (void *)__tickTimer;
    __tickTimer = v11;

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTimer:forMode:", __tickTimer, *MEMORY[0x24BDBCA90]);

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addTimer:forMode:", __tickTimer, *MEMORY[0x24BDF7F78]);

  }
}

+ (void)registerSweepingClock:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = a3;
  v24 = v3;
  if (!__sweepingClocks)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v5 = (void *)__sweepingClocks;
    __sweepingClocks = (uint64_t)v4;

    objc_msgSend(v24, "updateInterval");
    __sweepUpdateInterval = v6;
    objc_msgSend(v24, "coarseUpdateInterval");
    v3 = v24;
    __sweepCoarseUpdateInterval = v7;
  }
  if (v3)
  {
    objc_msgSend((id)__sweepingClocks, "addObject:", v3);
    objc_msgSend(v24, "updateInterval");
    v9 = v8;
    objc_msgSend((id)__sweepTimer, "timeInterval");
    if (v9 < v10)
    {
      objc_msgSend((id)__sweepTimer, "invalidate");
      v11 = (void *)__sweepTimer;
      __sweepTimer = 0;

      objc_msgSend(v24, "updateInterval");
      __sweepUpdateInterval = v12;
    }
    objc_msgSend(v24, "coarseUpdateInterval");
    v3 = v24;
    if (v13 < *(double *)&__sweepCoarseUpdateInterval)
    {
      objc_msgSend(v24, "coarseUpdateInterval");
      v3 = v24;
      __sweepCoarseUpdateInterval = v14;
    }
  }
  if (!__sweepTimer)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)__lastCoarseSweepUpdateTime;
    __lastCoarseSweepUpdateTime = v15;

    v17 = objc_alloc(MEMORY[0x24BDBCF40]);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dateByAddingTimeInterval:", *(double *)&__sweepUpdateInterval);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "initWithFireDate:interval:target:selector:userInfo:repeats:", v19, objc_opt_class(), sel_updateTimeForAllSweeping, 0, 1, *(double *)&__sweepUpdateInterval);
    v21 = (void *)__sweepTimer;
    __sweepTimer = v20;

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addTimer:forMode:", __sweepTimer, *MEMORY[0x24BDBCA90]);

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addTimer:forMode:", __sweepTimer, *MEMORY[0x24BDF7F78]);

    v3 = v24;
  }

}

+ (void)unregisterClock:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "runMode");
  if (v4 >= 2)
  {
    if (v4 == 2)
      objc_msgSend(a1, "unregisterSweepingClock:", v5);
  }
  else
  {
    objc_msgSend(a1, "unregisterTickingClock:", v5);
  }

}

+ (void)unregisterTickingClock:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)__tickingClocks, "removeObject:", a3);
  if (!objc_msgSend((id)__tickingClocks, "count"))
  {
    if (!__sweepingClocks)
      +[MTUIRenderedHandViewFactory flushAllCaches](MTUIRenderedHandViewFactory, "flushAllCaches");
    objc_msgSend((id)__flutterTimer, "invalidate");
    v3 = (void *)__flutterTimer;
    __flutterTimer = 0;

    v4 = (void *)__flutterClocks;
    __flutterClocks = 0;

    objc_msgSend((id)__tickTimer, "invalidate");
    v5 = (void *)__tickTimer;
    __tickTimer = 0;

    v6 = (void *)__tickingClocks;
    __tickingClocks = 0;

  }
}

+ (void)unregisterSweepingClock:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)__sweepingClocks, "removeObject:", a3);
  if (objc_msgSend((id)__sweepingClocks, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v3 = (id)__sweepingClocks;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v21;
      v7 = 3.4028e38;
      v8 = 3.4028e38;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v21 != v6)
            objc_enumerationMutation(v3);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v10, "updateInterval", (_QWORD)v20);
          *(float *)&v11 = v11;
          v8 = fminf(v8, *(float *)&v11);
          objc_msgSend(v10, "coarseUpdateInterval");
          *(float *)&v12 = v12;
          v7 = fminf(v7, *(float *)&v12);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v5);
      v13 = v7;
      v14 = v8;
    }
    else
    {
      v13 = 3.40282347e38;
      v14 = 3.40282347e38;
    }

    __sweepCoarseUpdateInterval = *(_QWORD *)&v13;
    objc_msgSend((id)__sweepTimer, "timeInterval");
    if (vabdd_f64(v14, v18) > 0.000001)
    {
      __sweepUpdateInterval = *(_QWORD *)&v14;
      objc_msgSend((id)__sweepTimer, "invalidate");
      v19 = (void *)__sweepTimer;
      __sweepTimer = 0;

      +[MTUIAnalogClockView registerSweepingClock:](MTUIAnalogClockView, "registerSweepingClock:", 0);
    }
  }
  else
  {
    if (!__tickingClocks)
      +[MTUIRenderedHandViewFactory flushAllCaches](MTUIRenderedHandViewFactory, "flushAllCaches");
    objc_msgSend((id)__sweepTimer, "invalidate");
    v15 = (void *)__sweepTimer;
    __sweepTimer = 0;

    v16 = (void *)__lastCoarseSweepUpdateTime;
    __lastCoarseSweepUpdateTime = 0;

    v17 = (void *)__sweepingClocks;
    __sweepingClocks = 0;

  }
}

+ (CGSize)sizeForStyle:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend((id)objc_msgSend(a1, "classForStyle:", a3), "clockSize");
  result.height = v4;
  result.width = v3;
  return result;
}

+ (UIEdgeInsets)insetsForStyle:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  objc_msgSend((id)objc_msgSend(a1, "classForStyle:", a3), "shadowInsets");
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (id)analogClockWithStyle:(int64_t)a3
{
  return objc_alloc_init((Class)objc_msgSend(a1, "classForStyle:", a3));
}

+ (double)faceRadius
{
  return 0.0;
}

+ (double)secondHandLength
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "secondHandMainLength");
  v4 = v3;
  objc_msgSend(a1, "secondHandOverhangLength");
  return v4 + v5;
}

+ (double)secondHandMainLength
{
  double v2;

  objc_msgSend(a1, "faceRadius");
  return v2 * 0.88;
}

+ (double)secondHandOverhangLength
{
  double v2;

  objc_msgSend(a1, "faceRadius");
  return v2 * 0.112;
}

+ (double)minuteHandLength
{
  double v2;

  objc_msgSend(a1, "faceRadius");
  return v2 * 0.938;
}

+ (double)hourHandLength
{
  double v2;

  objc_msgSend(a1, "faceRadius");
  return v2 * 0.533;
}

+ (double)secondHandWidth
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "faceRadius");
  v4 = v3 * 0.01;
  objc_msgSend(a1, "antialiasPaddingRatio");
  return v4 * (1.0 / v5);
}

+ (double)minuteHandWidth
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "faceRadius");
  v4 = v3 * 0.036;
  objc_msgSend(a1, "antialiasPaddingRatio");
  return v4 * (1.0 / v5);
}

+ (double)hourHandWidth
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "faceRadius");
  v4 = v3 * 0.036;
  objc_msgSend(a1, "antialiasPaddingRatio");
  return v4 * (1.0 / v5);
}

+ (int64_t)style
{
  return -1;
}

+ (id)resourcePath
{
  return 0;
}

+ (id)dayTimeTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

+ (id)dayTimeFaceColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

+ (id)nightTimeTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

+ (id)nightTimeFaceColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

+ (id)dayTimeOverHourHandDotColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

+ (id)nightTimeOverHourHandDotColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

+ (id)overSecondHandDotColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
}

+ (id)dayTimeHourHandColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

+ (id)nightTimeHourHandColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

+ (id)dayTimeMinuteHandColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

+ (id)nightTimeMinuteHandColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

+ (id)dayTimeSecondHandColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
}

+ (id)nightTimeSecondHandColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
}

+ (double)numeralInset
{
  double v2;

  objc_msgSend(a1, "faceRadius");
  return v2 * 0.23;
}

+ (id)numeralFont
{
  void *v2;
  double v3;

  v2 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(a1, "faceRadius");
  return (id)objc_msgSend(v2, "_lightSystemFontOfSize:", v3 * 0.25);
}

+ (BOOL)doesFaceHaveShadow
{
  return 0;
}

+ (UIEdgeInsets)shadowInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x24BDF7718];
  v3 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v4 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)antialiasPaddingRatio
{
  return 1.0;
}

+ (BOOL)hasOverHourHandDot
{
  return 1;
}

+ (BOOL)hasOverSecondHandDot
{
  return 1;
}

+ (double)overHourHandDotSize
{
  double v2;

  objc_msgSend(a1, "hourHandWidth");
  return v2 * 3.0;
}

+ (double)overSecondHandDotSize
{
  double v2;

  objc_msgSend(a1, "secondHandWidth");
  return v2 * 3.0;
}

+ (CGSize)clockSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(a1, "faceRadius");
  v3 = v2 + v2;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)shadowInfoAtIndex:(unint64_t)a3
{
  MTUIShadowInfo *v3;

  v3 = [MTUIShadowInfo alloc];
  return -[MTUIShadowInfo initWithColor:radius:offset:scale:](v3, "initWithColor:radius:offset:scale:", 0, 0.0, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), 0.0);
}

+ (CGPoint)handRotationalCenterForHand:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  if (a3 == 2)
  {
    objc_msgSend(a1, "secondHandOverhangLength");
    v5 = v7;
    objc_msgSend(a1, "secondHandOverhangLength");
    v9 = v8;
    objc_msgSend(a1, "secondHandMainLength");
    v11 = v9 + v10;
  }
  else
  {
    if (a3 == 1)
    {
      objc_msgSend(a1, "minuteHandWidth");
      v5 = v12;
      objc_msgSend(a1, "minuteHandLength");
    }
    else
    {
      if (a3)
      {
        v14 = *MEMORY[0x24BDBEFB0];
        v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
        goto LABEL_10;
      }
      objc_msgSend(a1, "hourHandWidth");
      v5 = v4;
      objc_msgSend(a1, "hourHandLength");
    }
    v11 = v6 + v6;
  }
  v13 = 1.0 - v5 / v11;
  v14 = 0.5;
LABEL_10:
  result.y = v13;
  result.x = v14;
  return result;
}

+ (CGPoint)shadowRotationalCenterForHand:(int64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)updateInterval
{
  return 0.0333333351;
}

- (double)coarseUpdateInterval
{
  return 5.0;
}

+ (id)imageCacheNameForType:(int)a3 daytime:(BOOL)a4
{
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  __CFString *v13;

  switch(a3)
  {
    case 0:
      v9 = CFSTR("face-nighttime");
      v10 = CFSTR("face-daytime");
      goto LABEL_16;
    case 1:
    case 2:
    case 3:
      if (a4)
        v5 = CFSTR("-daytime");
      else
        v5 = CFSTR("-nighttime");
      if (MTUIMainScreenScale() <= 1.0)
        v6 = CFSTR(".png");
      else
        v6 = CFSTR("@2x.png");
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](GeneratedBitmapHandNames[a3 - 1], "stringByAppendingString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    case 4:
      v9 = CFSTR("middledot-nighttime");
      v10 = CFSTR("middledot-daytime");
LABEL_16:
      if (a4)
        v13 = (__CFString *)v10;
      else
        v13 = (__CFString *)v9;
      if (MTUIMainScreenScale() <= 1.0)
        v11 = CFSTR(".png");
      else
        v11 = CFSTR("@2x.png");
      v12 = v13;
      goto LABEL_23;
    case 5:
      if (MTUIMainScreenScale() <= 1.0)
        v11 = CFSTR(".png");
      else
        v11 = CFSTR("@2x.png");
      v12 = CFSTR("reddot");
LABEL_23:
      -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = 0;
      break;
  }
  return v8;
}

+ (BOOL)shouldCacheImageOnDiskForType:(int)a3 dayTime:(BOOL)a4
{
  return 1;
}

+ (id)imageForType:(int)a3 dayTime:(BOOL)a4 generation:(id)a5
{
  return (id)objc_msgSend(a1, "imageForType:dayTime:generation:ignoreCache:", *(_QWORD *)&a3, a4, a5, 0);
}

+ (id)imageForType:(int)a3 dayTime:(BOOL)a4 generation:(id)a5 ignoreCache:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  uint64_t v8;
  void (**v10)(_QWORD);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  BOOL v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;

  v6 = a6;
  v7 = a4;
  v8 = *(_QWORD *)&a3;
  v10 = (void (**)(_QWORD))a5;
  v11 = objc_msgSend(a1, "style");
  v12 = 100;
  if (!v7)
    v12 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12 + v8 + 1000 * v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MTImageCache();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = !v6;
  else
    v16 = 0;
  if (!v16)
  {
    if (!objc_msgSend(a1, "shouldCacheImageOnDiskForType:dayTime:", v8, v7))
    {
      v10[2](v10);
      v28 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v28;
      if (!v28)
        goto LABEL_19;
      goto LABEL_17;
    }
    v30 = v6;
    objc_msgSend(a1, "cacheVersionedPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "resourcePath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = a1;
    v21 = v19;
    objc_msgSend(v20, "imageCacheNameForType:daytime:", v8, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingPathComponent:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithContentsOfFile:", v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      LOBYTE(v6) = v30;
      if (!v24)
      {
        v10[2](v10);
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = (void *)v25;
          dispatch_get_global_queue(-2, 0);
          v27 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __67__MTUIAnalogClockView_imageForType_dayTime_generation_ignoreCache___block_invoke;
          block[3] = &unk_24F014918;
          v32 = v21;
          v24 = v26;
          v33 = v24;
          v34 = v23;
          dispatch_async(v27, block);

        }
        else
        {
          v24 = 0;
        }
      }
    }
    else
    {
      LOBYTE(v6) = v30;
    }

    v15 = v24;
    if (v24)
    {
LABEL_17:
      if (!v6)
        objc_msgSend(v14, "setObject:forKey:", v15, v13);
    }
  }
LABEL_19:

  return v15;
}

void __67__MTUIAnalogClockView_imageForType_dayTime_generation_ignoreCache___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", *(_QWORD *)(a1 + 32), 0);

  UIImagePNGRepresentation(*(UIImage **)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeToFile:atomically:", *(_QWORD *)(a1 + 48), 1);

}

+ (id)makeClockFaceForDaytime:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t i;
  void *v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  CGFloat v45;
  CGContext *CurrentContext;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  CGColor *v52;
  CGFloat v53;
  void *v54;
  CGContext *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  uint64_t j;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __double2 v71;
  void *v72;
  double v74;
  double v75;
  void *ty;
  double v77;
  void *v78;
  double v79;
  double v80[2];
  CGAffineTransform v81;
  CGAffineTransform v82;
  CGAffineTransform v83;
  _QWORD v84[2];
  _QWORD v85[4];
  CGSize v86;
  CGSize v87;

  v85[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(a1, "dayTimeFaceColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dayTimeTextColor");
  }
  else
  {
    objc_msgSend(a1, "nightTimeFaceColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "nightTimeTextColor");
  }
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "shadowInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(a1, "clockSize");
  v15 = v14;
  v17 = v16;
  v18 = *MEMORY[0x24BDBEFB0];
  v19 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v20 = objc_msgSend(a1, "doesFaceHaveShadow");
  v21 = MTUIMainScreenScale();
  v86.width = v15;
  v86.height = v17;
  UIGraphicsBeginImageContextWithOptions(v86, 0, v21);
  v22 = v9 + v18;
  v23 = v17;
  v24 = v7 + v19;
  v25 = v9 + v13;
  v26 = v22;
  v27 = v15;
  v28 = v15 - v25;
  v29 = v23 - (v7 + v11);
  v79 = v24;
  UIRectGetCenter();
  v74 = v31;
  v75 = v30;
  if (v20)
  {
    v77 = v11 + v29 + v79 + 1.0;
    for (i = 4; i != -1; --i)
    {
      objc_msgSend(a1, "shadowInfoAtIndex:", i);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", v26, v79, v28, v29);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      CGAffineTransformMakeTranslation(&v83, 0.0, -v77);
      objc_msgSend(v34, "applyTransform:", &v83);
      objc_msgSend(v33, "scale");
      v36 = v27 * (1.0 - v35) * 0.5;
      objc_msgSend(v33, "scale");
      CGAffineTransformMakeTranslation(&v82, v36, -((1.0 - v37) * v23) * 0.5);
      objc_msgSend(v34, "applyTransform:", &v82);
      objc_msgSend(v33, "scale");
      v39 = v38;
      objc_msgSend(v33, "scale");
      CGAffineTransformMakeScale(&v81, v39, v40);
      objc_msgSend(v34, "applyTransform:", &v81);
      objc_msgSend(v33, "offset");
      v42 = v41;
      v43 = v27;
      v45 = v77 + v44;
      CurrentContext = UIGraphicsGetCurrentContext();
      objc_msgSend(v33, "radius");
      v47 = v26;
      v48 = v23;
      v50 = v49;
      objc_msgSend(v33, "color");
      v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v52 = (CGColor *)objc_msgSend(v51, "CGColor");
      v87.width = v42;
      v87.height = v45;
      v27 = v43;
      v53 = v50;
      v23 = v48;
      v26 = v47;
      CGContextSetShadowWithColor(CurrentContext, v87, v53, v52);

      objc_msgSend(v34, "fill");
    }
  }
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", v26, v79, v28, v29);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = UIGraphicsGetCurrentContext();
  CGContextSetShadowWithColor(v55, *MEMORY[0x24BDBF148], 0.0, 0);
  v78 = v4;
  objc_msgSend(v4, "setFill");
  ty = v54;
  objc_msgSend(v54, "fill");
  objc_msgSend(a1, "faceRadius");
  v57 = v56;
  objc_msgSend(a1, "numeralInset");
  v59 = v57 - v58;
  objc_msgSend(a1, "numeralFont");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = *MEMORY[0x24BDF65F8];
  v62 = *MEMORY[0x24BDF6600];
  v63 = -1.04719755;
  for (j = 1; j != 13; ++j)
  {
    v65 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", j);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "stringValue");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v61;
    v84[1] = v62;
    v85[0] = v60;
    v85[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
    v68 = (void *)v5;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)objc_msgSend(v65, "initWithString:attributes:", v67, v69);

    v5 = (uint64_t)v68;
    objc_msgSend(v70, "size");
    v71 = __sincos_stret(v63);
    v80[0] = v75 + v59 * v71.__cosval;
    v80[1] = v59 * v71.__sinval + v74;
    objc_msgSend(a1, "adjustNumberalCenter:forNumeralIndex:", v80, j);
    UIRectCenteredAboutPointScale();
    objc_msgSend(v70, "drawInRect:");
    v63 = v63 + 0.523598776;

  }
  UIGraphicsGetImageFromCurrentImageContext();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v72;
}

+ (id)clockFaceForDaytime:(BOOL)a3
{
  return (id)objc_msgSend(a1, "clockFaceForDaytime:ignoreCache:", a3, 0);
}

+ (id)clockFaceForDaytime:(BOOL)a3 ignoreCache:(BOOL)a4
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__MTUIAnalogClockView_clockFaceForDaytime_ignoreCache___block_invoke;
  v5[3] = &__block_descriptor_41_e14___UIImage_8__0l;
  v5[4] = a1;
  v6 = a3;
  objc_msgSend(a1, "imageForType:dayTime:generation:ignoreCache:", 0, a3, v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __55__MTUIAnalogClockView_clockFaceForDaytime_ignoreCache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeClockFaceForDaytime:", *(unsigned __int8 *)(a1 + 40));
}

+ (id)makeClockHand:(int64_t)a3 daytime:(BOOL)a4
{
  double v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  CGSize v20;

  v6 = 0.0;
  switch(a3)
  {
    case -1:
    case 3:
      MTLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        +[MTUIAnalogClockView makeClockHand:daytime:].cold.1(a3, v7);

      goto LABEL_5;
    case 0:
      if (a4)
        objc_msgSend(a1, "dayTimeHourHandColor");
      else
        objc_msgSend(a1, "nightTimeHourHandColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "hourHandLength");
      v9 = v10;
      objc_msgSend(a1, "hourHandWidth");
      goto LABEL_18;
    case 1:
      if (a4)
        objc_msgSend(a1, "dayTimeMinuteHandColor");
      else
        objc_msgSend(a1, "nightTimeMinuteHandColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "minuteHandLength");
      v9 = v12;
      objc_msgSend(a1, "minuteHandWidth");
      goto LABEL_18;
    case 2:
      if (a4)
        objc_msgSend(a1, "dayTimeSecondHandColor");
      else
        objc_msgSend(a1, "nightTimeSecondHandColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "secondHandLength");
      v9 = v13;
      objc_msgSend(a1, "secondHandWidth");
LABEL_18:
      v6 = v11;
      break;
    default:
LABEL_5:
      v8 = 0;
      v9 = 0.0;
      break;
  }
  v20.width = v6;
  v20.height = v9;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a3 == 2)
    v16 = 2;
  else
    v16 = 1;
  objc_msgSend(v14, "setLineCapStyle:", v16);
  objc_msgSend(a1, "antialiasPaddingRatio");
  objc_msgSend(v15, "setLineWidth:", v6 * v17);
  objc_msgSend(v15, "moveToPoint:", v6 * 0.5, v6);
  objc_msgSend(v15, "addLineToPoint:", v6 * 0.5, v9 - v6);
  objc_msgSend(v8, "setStroke");
  objc_msgSend(v15, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v18;
}

+ (id)clockHand:(int64_t)a3 daytime:(BOOL)a4
{
  _QWORD v5[6];
  BOOL v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__MTUIAnalogClockView_clockHand_daytime___block_invoke;
  v5[3] = &__block_descriptor_49_e14___UIImage_8__0l;
  v5[4] = a1;
  v5[5] = a3;
  v6 = a4;
  objc_msgSend(a1, "imageForType:dayTime:generation:", (a3 + 1), a4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __41__MTUIAnalogClockView_clockHand_daytime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeClockHand:daytime:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

+ (id)makeDotImageSize:(double)a3 color:(id)a4
{
  float v6;
  CGFloat v7;
  CGFloat v8;
  id v9;
  double MidX;
  double MidY;
  id v12;
  double v13;
  void *v14;
  CGSize v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v6 = a3;
  v7 = roundf(v6);
  v8 = (v7 - a3) * 0.5;
  v9 = a4;
  v16.width = v7;
  v16.height = v7;
  UIGraphicsBeginImageContextWithOptions(v16, 0, 0.0);
  v17.origin.x = v8;
  v17.origin.y = v8;
  v17.size.width = a3;
  v17.size.height = a3;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = v8;
  v18.origin.y = v8;
  v18.size.width = a3;
  v18.size.height = a3;
  MidY = CGRectGetMidY(v18);
  v12 = objc_alloc_init(MEMORY[0x24BDF6870]);
  v19.origin.x = v8;
  v19.origin.y = v8;
  v19.size.width = a3;
  v19.size.height = a3;
  objc_msgSend(v12, "moveToPoint:", CGRectGetMidX(v19), 0.0);
  objc_msgSend(a1, "antialiasPaddingRatio");
  objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v13 * a3 * 0.5, 4.71238898, 10.9955743);
  objc_msgSend(v12, "closePath");
  objc_msgSend(v9, "setFill");

  objc_msgSend(v12, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v14;
}

+ (id)overHourHandDotImageForDaytime:(BOOL)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "overHourHandDotSize");
  v6 = v5;
  if (a3)
    objc_msgSend(a1, "dayTimeOverHourHandDotColor");
  else
    objc_msgSend(a1, "nightTimeOverHourHandDotColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "makeDotImageSize:color:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)overHourHandDotForDayTime:(BOOL)a3
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__MTUIAnalogClockView_overHourHandDotForDayTime___block_invoke;
  v4[3] = &__block_descriptor_41_e14___UIImage_8__0l;
  v4[4] = a1;
  v5 = a3;
  objc_msgSend(a1, "imageForType:dayTime:generation:", 4, a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __49__MTUIAnalogClockView_overHourHandDotForDayTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "overHourHandDotImageForDaytime:", *(unsigned __int8 *)(a1 + 40));
}

+ (id)makeOverSecondHandDotImage
{
  double v3;
  double v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "overSecondHandDotSize");
  v4 = v3;
  objc_msgSend(a1, "overSecondHandDotColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "makeDotImageSize:color:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)overSecondHandDotImage
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__MTUIAnalogClockView_overSecondHandDotImage__block_invoke;
  v3[3] = &__block_descriptor_40_e14___UIImage_8__0l;
  v3[4] = a1;
  objc_msgSend(a1, "imageForType:dayTime:generation:", 5, 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __45__MTUIAnalogClockView_overSecondHandDotImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeOverSecondHandDotImage");
}

+ (id)imageInBundleForName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setFrame:(CGRect)a3
{
  double y;
  double x;
  double v6;
  double v7;
  objc_super v8;

  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend((id)objc_opt_class(), "clockSize");
  v8.receiver = self;
  v8.super_class = (Class)MTUIAnalogClockView;
  -[MTUIAnalogClockView setFrame:](&v8, sel_setFrame_, x, y, v6, v7);
}

- (MTUIAnalogClockView)init
{
  MTUIAnalogClockView *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSCalendar *calendar;
  void *v7;
  uint64_t v8;
  UIImage *faceDayImage;
  uint64_t v10;
  UIImage *faceNightImage;
  uint64_t v12;
  UIImageView *faceView;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t i;
  void *v20;
  MTUIBitmapHandView *v21;
  uint64_t v22;
  UIView *v23;
  void *v24;
  MTUIBitmapHandView *v25;
  uint64_t v26;
  UIView *v27;
  void *v28;
  uint64_t v29;
  UIImageView *middleDotDay;
  void *v31;
  uint64_t v32;
  UIImageView *middleDotNight;
  void *v34;
  uint64_t v35;
  UIImageView *middleRedDot;
  MTUIAnalogClockView *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)MTUIAnalogClockView;
  v2 = -[MTUIAnalogClockView initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_handleLocaleChange, *MEMORY[0x24BDBCA70], 0);

    v2->_runMode = -1;
    v4 = objc_alloc(MEMORY[0x24BDBCE48]);
    v5 = objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v5;

    v7 = (void *)objc_opt_class();
    objc_msgSend(v7, "clockFaceForDaytime:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    faceDayImage = v2->_faceDayImage;
    v2->_faceDayImage = (UIImage *)v8;

    objc_msgSend(v7, "clockFaceForDaytime:", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    faceNightImage = v2->_faceNightImage;
    v2->_faceNightImage = (UIImage *)v10;

    v2->_nighttime = 0;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v2->_faceDayImage);
    faceView = v2->_faceView;
    v2->_faceView = (UIImageView *)v12;

    -[MTUIAnalogClockView addSubview:](v2, "addSubview:", v2->_faceView);
    v14 = objc_msgSend(v7, "doesFaceHaveShadow");
    objc_msgSend(v7, "clockSize");
    if (v14)
      objc_msgSend(v7, "shadowInsets");
    UIRectGetCenter();
    v16 = v15;
    v18 = v17;
    for (i = 0; ; ++i)
    {
      objc_msgSend(v7, "clockHand:daytime:", i, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = [MTUIBitmapHandView alloc];
      objc_msgSend(v7, "handRotationalCenterForHand:", i);
      v22 = -[MTUIBitmapHandView initWithImage:rotationalCenter:](v21, "initWithImage:rotationalCenter:", v20);
      v23 = v2->_dayHands[i];
      v2->_dayHands[i] = (UIView *)v22;

      -[MTUIAnalogClockView addSubview:](v2, "addSubview:", v2->_dayHands[i]);
      -[UIView setCenter:](v2->_dayHands[i], "setCenter:", v16, v18);
      if (i == 2)
        break;
      objc_msgSend(v7, "clockHand:daytime:", i, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = [MTUIBitmapHandView alloc];
      objc_msgSend(v7, "handRotationalCenterForHand:", i);
      v26 = -[MTUIBitmapHandView initWithImage:rotationalCenter:](v25, "initWithImage:rotationalCenter:", v24);
      v27 = v2->_nightHands[i];
      v2->_nightHands[i] = (UIView *)v26;

      -[MTUIAnalogClockView addSubview:](v2, "addSubview:", v2->_nightHands[i]);
      -[UIView setCenter:](v2->_nightHands[i], "setCenter:", v16, v18);
      -[UIView setHidden:](v2->_nightHands[i], "setHidden:", 1);

    }
    if ((objc_msgSend(v7, "hasOverHourHandDot") & 1) != 0)
    {
      objc_msgSend(v7, "overHourHandDotForDayTime:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v28);
      middleDotDay = v2->_middleDotDay;
      v2->_middleDotDay = (UIImageView *)v29;

      -[MTUIAnalogClockView insertSubview:belowSubview:](v2, "insertSubview:belowSubview:", v2->_middleDotDay, v2->_dayHands[2]);
      -[UIImageView setCenter:](v2->_middleDotDay, "setCenter:", v16, v18);
      objc_msgSend(v7, "overHourHandDotForDayTime:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v31);
      middleDotNight = v2->_middleDotNight;
      v2->_middleDotNight = (UIImageView *)v32;

      -[MTUIAnalogClockView insertSubview:belowSubview:](v2, "insertSubview:belowSubview:", v2->_middleDotNight, v2->_dayHands[2]);
      -[UIImageView setCenter:](v2->_middleDotNight, "setCenter:", v16, v18);
      -[UIImageView setHidden:](v2->_middleDotNight, "setHidden:", 1);

    }
    if (objc_msgSend(v7, "hasOverSecondHandDot"))
    {
      objc_msgSend(v7, "overSecondHandDotImage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v34);
      middleRedDot = v2->_middleRedDot;
      v2->_middleRedDot = (UIImageView *)v35;

      -[UIImageView setCenter:](v2->_middleRedDot, "setCenter:", v16, v18);
      -[MTUIAnalogClockView addSubview:](v2, "addSubview:", v2->_middleRedDot);

    }
    v37 = v2;
  }

  return v2;
}

- (int64_t)style
{
  return objc_msgSend((id)objc_opt_class(), "style");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "clockSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setHandTransformForHandIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  _OWORD v7[8];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[8];

  v16[4] = xmmword_253D8BF78;
  v16[5] = *(_OWORD *)&qword_253D8BF88;
  v16[6] = xmmword_253D8BF98;
  v16[7] = unk_253D8BFA8;
  v16[0] = __transformCache;
  v16[1] = unk_253D8BF48;
  v16[2] = xmmword_253D8BF58;
  v16[3] = unk_253D8BF68;
  -[UIView layer](self->_dayHands[a3], "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransform:", v16);

  v12 = xmmword_253D8BF78;
  v13 = *(_OWORD *)&qword_253D8BF88;
  v14 = xmmword_253D8BF98;
  v15 = unk_253D8BFA8;
  v8 = __transformCache;
  v9 = unk_253D8BF48;
  v10 = xmmword_253D8BF58;
  v11 = unk_253D8BF68;
  -[UIView layer](self->_nightHands[a3], "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v12;
  v7[5] = v13;
  v7[6] = v14;
  v7[7] = v15;
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  v7[3] = v11;
  objc_msgSend(v6, "setTransform:", v7);

}

- (void)updateTimeContinuously:(int64_t)a3
{
  -[MTUIAnalogClockView setHandTransformForHandIndex:](self, "setHandTransformForHandIndex:", 2);
}

- (void)setHandAngle:(double)a3 forHandIndex:(int64_t)a4
{
  float v6;
  __float2 v7;

  v6 = fmod(a3, 6.28318531);
  v7 = __sincosf_stret(v6);
  *(double *)&__transformCache = v7.__cosval;
  *((double *)&__transformCache + 1) = v7.__sinval;
  *(double *)&xmmword_253D8BF58 = (float)-v7.__sinval;
  *((double *)&xmmword_253D8BF58 + 1) = v7.__cosval;
  -[MTUIAnalogClockView setHandTransformForHandIndex:](self, "setHandTransformForHandIndex:", a4);
}

- (void)updateFlutter
{
  uint64_t flutterIndex;
  double seconds;
  void *v4;

  flutterIndex = self->_flutterIndex;
  if ((int)flutterIndex > 2)
  {
    objc_msgSend((id)__flutterTimer, "invalidate");
    v4 = (void *)__flutterTimer;
    __flutterTimer = 0;

  }
  else
  {
    seconds = self->_seconds;
    self->_flutterIndex = flutterIndex + 1;
    -[MTUIAnalogClockView setHandAngle:forHandIndex:](self, "setHandAngle:forHandIndex:", 2, (seconds + updateFlutter_flutterAmounts[flutterIndex]) * 0.0174532925 * 6.0);
  }
}

- (void)setNighttime:(BOOL)a3
{
  UIImageView *faceView;
  int *v5;
  uint64_t v6;
  UIView **nightHands;
  id v8;

  if (self->_nighttime != a3)
  {
    self->_nighttime = a3;
    faceView = self->_faceView;
    v5 = &OBJC_IVAR___MTUIAnalogClockView__faceDayImage;
    if (a3)
      v5 = &OBJC_IVAR___MTUIAnalogClockView__faceNightImage;
    -[UIImageView setImage:](faceView, "setImage:", *(Class *)((char *)&self->super.super.super.isa + *v5));
    v6 = 0;
    nightHands = self->_nightHands;
    do
    {
      if (nightHands[v6])
      {
        -[UIView setHidden:](self->_dayHands[v6], "setHidden:", self->_nighttime);
        -[UIView setHidden:](nightHands[v6], "setHidden:", !self->_nighttime);
      }
      ++v6;
    }
    while (v6 != 3);
    -[UIImageView setHidden:](self->_middleDotDay, "setHidden:", self->_nighttime);
    -[UIImageView setHidden:](self->_middleDotNight, "setHidden:", !self->_nighttime);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("AnalogClockDidChangeNighttimeNotification"), self);

  }
}

- (void)updateTime
{
  -[MTUIAnalogClockView updateTimeAnimated:](self, "updateTimeAnimated:", 1);
}

- (void)updateTimeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSDate *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;

  v3 = a3;
  v16 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  v5 = self->_time;
  -[MTUIAnalogClockView setTime:animated:](self, "setTime:animated:", v16, v3);
  if (!v5)
    goto LABEL_16;
  -[NSDate timeIntervalSinceDate:](self->_time, "timeIntervalSinceDate:", v5);
  if (v6 <= 0.0 || v6 >= 300.0)
    goto LABEL_16;
  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 32, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hour");

  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 32, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hour");

  if (v10)
    v11 = 0;
  else
    v11 = v8 == 23;
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("AnalogClockDidCrossMidnightNotification");
    goto LABEL_15;
  }
  if (v10 == 12 && v8 == 11)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("AnalogClockDidCrossNoonNotification");
LABEL_15:
    objc_msgSend(v13, "postNotificationName:object:", v15, self);

  }
LABEL_16:

}

- (int64_t)hour
{
  void *v2;
  int64_t v3;

  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 32, self->_time);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hour");

  return v3;
}

- (int64_t)minute
{
  void *v2;
  int64_t v3;

  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 64, self->_time);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minute");

  return v3;
}

- (void)setTime:(id)a3
{
  -[MTUIAnalogClockView setTime:animated:](self, "setTime:animated:", a3, 0);
}

- (void)setTime:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id *p_time;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  int64_t runMode;
  long double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  long double __y;

  v4 = a4;
  v22 = a3;
  p_time = (id *)&self->_time;
  v8 = -[NSDate isEqualToDate:](self->_time, "isEqualToDate:", v22);
  v9 = v22;
  if (!v8)
  {
    v10 = v22;
    if (*p_time != v22)
    {
      objc_storeStrong((id *)&self->_time, a3);
      v10 = *p_time;
    }
    -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 224, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hour");
    v13 = objc_msgSend(v11, "minute");
    v14 = (double)objc_msgSend(v11, "second");
    runMode = self->_runMode;
    if (runMode == 2)
    {
      if (v4)
      {
        objc_msgSend(*p_time, "timeIntervalSinceReferenceDate");
        v14 = modf(v16, &__y) + v14;
      }
    }
    else if (runMode == 1)
    {
      v14 = v14 + 0.15;
      self->_seconds = v14;
    }
    self->_flutterIndex = 0;
    v17 = (double)v12;
    if (self->_runMode == 2)
    {
      v18 = v14 / 60.0 + (double)v13;
      v19 = v14 * 0.104719755;
      v20 = v18 * 0.104719755;
      v21 = (v18 / 60.0 + v17) * 0.523598776;
    }
    else
    {
      v19 = v14 * 0.104719755;
      v20 = (double)v13 * 0.104719755;
      v21 = v20 / 12.0 + v17 * 0.523598776;
    }
    -[MTUIAnalogClockView setHandAngle:forHandIndex:](self, "setHandAngle:forHandIndex:", 2, v19);
    -[MTUIAnalogClockView setHandAngle:forHandIndex:](self, "setHandAngle:forHandIndex:", 1, v20);
    -[MTUIAnalogClockView setHandAngle:forHandIndex:](self, "setHandAngle:forHandIndex:", 0, v21);
    -[MTUIAnalogClockView setNighttime:](self, "setNighttime:", (unint64_t)(v12 - 18) < 0xFFFFFFFFFFFFFFF4);

    v9 = v22;
  }

}

- (NSTimeZone)timeZone
{
  return -[NSCalendar timeZone](self->_calendar, "timeZone");
}

- (void)setTimeZone:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToTimeZone:", v6);

  if ((v5 & 1) == 0)
  {
    -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v6);
    if (self->_runMode != -1)
    {
      if (self->_time)
      {
        self->_minuteHourAnimationTriggered = 0;
        if (-[MTUIAnalogClockView isStarted](self, "isStarted"))
        {
          -[MTUIAnalogClockView stop](self, "stop");
          -[MTUIAnalogClockView start](self, "start");
        }
        else
        {
          -[MTUIAnalogClockView updateTimeAnimated:](self, "updateTimeAnimated:", 0);
        }
      }
    }
  }

}

- (BOOL)isStarted
{
  return +[MTUIAnalogClockView isClockRegistered:](MTUIAnalogClockView, "isClockRegistered:", self);
}

- (void)start
{
  if (!-[MTUIAnalogClockView isStarted](self, "isStarted"))
  {
    -[MTUIAnalogClockView updateTimeAnimated:](self, "updateTimeAnimated:", 0);
    +[MTUIAnalogClockView registerClock:](MTUIAnalogClockView, "registerClock:", self);
    -[MTUIAnalogClockView updateTimeAnimated:](self, "updateTimeAnimated:", 1);
  }
}

- (void)stop
{
  +[MTUIAnalogClockView unregisterClock:](MTUIAnalogClockView, "unregisterClock:", self);
}

- (void)handleLocaleChange
{
  UIImage *v3;
  UIImage *faceDayImage;
  UIImage *v5;
  UIImage *faceNightImage;
  uint64_t v7;

  objc_msgSend((id)objc_opt_class(), "clockFaceForDaytime:ignoreCache:", 1, 1);
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  faceDayImage = self->_faceDayImage;
  self->_faceDayImage = v3;

  objc_msgSend((id)objc_opt_class(), "clockFaceForDaytime:ignoreCache:", 0, 1);
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  faceNightImage = self->_faceNightImage;
  self->_faceNightImage = v5;

  if (self->_nighttime)
    v7 = 432;
  else
    v7 = 424;
  -[UIImageView setImage:](self->_faceView, "setImage:", *(Class *)((char *)&self->super.super.super.isa + v7));
}

- (void)redrawSecondHand
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  UIView *v12;
  void *v13;
  MTUIBitmapHandView *v14;
  MTUIBitmapHandView *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIImageView *v21;
  void *v22;
  UIImageView *v23;
  UIImageView *middleRedDot;
  UIImageView *v25;
  void *v26;
  void *v27;
  void *v28;
  _OWORD v29[3];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v3 = (void *)objc_opt_class();
  v4 = 1000 * -[MTUIAnalogClockView style](self, "style");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4 + 103);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MTImageCache();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v5);

  objc_msgSend(v3, "cacheVersionedPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourcePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "imageCacheNameForType:daytime:", 3, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v10;
  objc_msgSend(v11, "_web_removeFileOnlyAtPath:", v10);

  v12 = self->_dayHands[2];
  -[UIView removeFromSuperview](v12, "removeFromSuperview");
  objc_msgSend(v3, "clockHand:daytime:", 2, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [MTUIBitmapHandView alloc];
  objc_msgSend(v3, "handRotationalCenterForHand:", 2);
  v15 = -[MTUIBitmapHandView initWithImage:rotationalCenter:](v14, "initWithImage:rotationalCenter:", v13);
  objc_storeStrong((id *)&self->_dayHands[2], v15);
  -[UIView center](v12, "center");
  -[MTUIBitmapHandView setCenter:](v15, "setCenter:");
  if (v12)
  {
    -[UIView transform](v12, "transform");
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
  }
  v33[0] = v34;
  v33[1] = v35;
  v33[2] = v36;
  -[MTUIBitmapHandView setTransform:](v15, "setTransform:", v33);
  -[MTUIAnalogClockView addSubview:](self, "addSubview:", v15);
  if (objc_msgSend(v3, "hasOverSecondHandDot"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4 | 5);
    v16 = objc_claimAutoreleasedReturnValue();
    MTImageCache();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v16;
    objc_msgSend(v17, "removeObjectForKey:", v16);

    objc_msgSend(v3, "imageCacheNameForType:daytime:", 5, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_web_removeFileOnlyAtPath:", v19);

    v21 = self->_middleRedDot;
    -[UIImageView removeFromSuperview](v21, "removeFromSuperview");
    objc_msgSend(v3, "overSecondHandDotImage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v22);
    middleRedDot = self->_middleRedDot;
    self->_middleRedDot = v23;

    -[UIImageView center](v21, "center");
    -[UIImageView setCenter:](self->_middleRedDot, "setCenter:");
    if (v21)
    {
      -[UIImageView transform](v21, "transform");
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v30 = 0u;
    }
    v25 = self->_middleRedDot;
    v29[0] = v30;
    v29[1] = v31;
    v29[2] = v32;
    -[UIImageView setTransform:](v25, "setTransform:", v29);
    -[MTUIAnalogClockView addSubview:](self, "addSubview:", self->_middleRedDot);

  }
}

- (int64_t)runMode
{
  return self->_runMode;
}

- (void)setRunMode:(int64_t)a3
{
  self->_runMode = a3;
}

- (UIImageView)faceView
{
  return self->_faceView;
}

- (NSDate)time
{
  return self->_time;
}

- (BOOL)isNighttime
{
  return self->_nighttime;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;

  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_middleRedDot, 0);
  objc_storeStrong((id *)&self->_middleDotNight, 0);
  objc_storeStrong((id *)&self->_middleDotDay, 0);
  for (i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_nightHands[i], 0);
  for (j = 2; j != -1; --j)
    objc_storeStrong((id *)&self->_dayHands[j], 0);
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_storeStrong((id *)&self->_faceNightImage, 0);
  objc_storeStrong((id *)&self->_faceDayImage, 0);
}

+ (void)makeClockHand:(uint64_t)a1 daytime:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_2279B4000, a2, OS_LOG_TYPE_DEBUG, "Tried to make clock hand of type %ld", (uint8_t *)&v2, 0xCu);
}

@end
