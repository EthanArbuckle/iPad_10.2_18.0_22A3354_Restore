@implementation ULHomeSlamStopDetection

- (ULHomeSlamStopDetection)initWithDB:(ULDatabase *)a3
{
  ULHomeSlamStopDetection *v4;
  ULHomeSlamStopDetection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ULHomeSlamStopDetection;
  v4 = -[ULHomeSlamStopDetection init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ULHomeSlamStopDetection setDb:](v4, "setDb:", a3);
  return v5;
}

- (id)runStopDetectionAnalysisFromTime:(double)a3 toTime:
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  __int128 *v11;
  __int128 *v12;
  uint64_t v13;
  __int128 **v14;

  v6 = *(id *)(objc_msgSend(a1, "db") + 120);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "fetchOdometryASCFromTime:toTime:", a2, a3);
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }

  memset(v10, 0, sizeof(v10));
  std::vector<CLMiLoOdometryTable::Entry>::__init_with_size[abi:ne180100]<CLMiLoOdometryTable::Entry*,CLMiLoOdometryTable::Entry*>((char *)v10, v11, v12, ((char *)v12 - (char *)v11) >> 5);
  objc_msgSend(a1, "_getStopMotionTriggersFromOdometryEntries:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (__int128 **)v10;
  std::vector<CLMiLoOdometryTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  v14 = &v11;
  std::vector<CLMiLoOdometryTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  return v8;
}

- (id)_getStopMotionTriggersFromOdometryEntries:()vector<CLMiLoOdometryTable:(std::allocator<CLMiLoOdometryTable::Entry>> *)a3 :Entry
{
  void *v5;
  Entry *var0;
  Entry *var1;
  int64_t v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULHomeSlamStopDetection _enterStaticState](self, "_enterStaticState");
  var0 = a3->var0;
  var1 = a3->var1;
  while (var0 != var1)
  {
    v8 = -[ULHomeSlamStopDetection state](self, "state");
    if (v8)
    {
      if (v8 == 1)
        -[ULHomeSlamStopDetection _runStaticStateLogicWithEntry:andTriggers:](self, "_runStaticStateLogicWithEntry:andTriggers:", var0, v5);
    }
    else
    {
      -[ULHomeSlamStopDetection _runMotionStateLogicWithEntry:andTriggers:](self, "_runMotionStateLogicWithEntry:andTriggers:", var0, v5);
    }
    var0 += 2;
  }
  return v5;
}

- (void)_runStaticStateLogicWithEntry:(const void *)a3 andTriggers:(id)a4
{
  ULHomeSlamMotionChangeTrigger *v6;
  void *v7;
  ULHomeSlamMotionChangeTrigger *v8;
  id v9;

  v9 = a4;
  if (-[ULHomeSlamStopDetection _shouldExitStaticState:](self, "_shouldExitStaticState:", a3))
  {
    -[ULHomeSlamStopDetection _enterMotionStateAtTime:](self, "_enterMotionStateAtTime:", *((double *)a3 + 2));
    v6 = [ULHomeSlamMotionChangeTrigger alloc];
    -[ULHomeSlamStopDetection _timepointToDate:](self, "_timepointToDate:", *((double *)a3 + 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ULHomeSlamMotionChangeTrigger initWithdate:andTrigger:](v6, "initWithdate:andTrigger:", v7, 0);
    objc_msgSend(v9, "addObject:", v8);

  }
}

- (void)_runMotionStateLogicWithEntry:(const void *)a3 andTriggers:(id)a4
{
  void *v6;
  ULHomeSlamMotionChangeTrigger *v7;
  id v8;

  v8 = a4;
  -[ULHomeSlamStopDetection _shouldExitMotionState:](self, "_shouldExitMotionState:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[ULHomeSlamMotionChangeTrigger initWithdate:andTrigger:]([ULHomeSlamMotionChangeTrigger alloc], "initWithdate:andTrigger:", v6, 1);
    objc_msgSend(v8, "addObject:", v7);

    -[ULHomeSlamStopDetection _enterStaticState](self, "_enterStaticState");
    -[ULHomeSlamStopDetection _runStaticStateLogicWithEntry:andTriggers:](self, "_runStaticStateLogicWithEntry:andTriggers:", a3, v8);
  }
  else
  {
    -[ULHomeSlamStopDetection _updateFencesAndTimersInMotionStateWithEntry:](self, "_updateFencesAndTimersInMotionStateWithEntry:", a3);
  }

}

- (BOOL)_shouldExitStaticState:(const void *)a3
{
  void *v4;

  -[ULHomeSlamStopDetection staticFence](self, "staticFence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "didFenceCrossWithOdometryEntry:", a3);

  return (char)a3;
}

- (id)_shouldExitMotionState:(const void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ULHomeSlamStopDetection _timepointToDate:](self, "_timepointToDate:", *((double *)a3 + 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULHomeSlamStopDetection shortTimer](self, "shortTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "checkTimeoutAtDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[ULHomeSlamStopDetection longTimer](self, "longTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "checkTimeoutAtDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_updateFencesAndTimersInMotionStateWithEntry:(const void *)a3
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;

  -[ULHomeSlamStopDetection _timepointToDate:](self, "_timepointToDate:", *((double *)a3 + 2));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ULHomeSlamStopDetection largeFence](self, "largeFence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "didFenceCrossWithOdometryEntry:", a3);

  if (v6)
    -[ULHomeSlamStopDetection _setLongMotionTimerStartingDate:](self, "_setLongMotionTimerStartingDate:", v9);
  -[ULHomeSlamStopDetection smallFence](self, "smallFence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "didFenceCrossWithOdometryEntry:", a3);

  if (v8)
    -[ULHomeSlamStopDetection _setShortMotionTimerStartingDate:](self, "_setShortMotionTimerStartingDate:", v9);

}

- (void)_enterStaticState
{
  -[ULHomeSlamStopDetection setState:](self, "setState:", 1);
  -[ULHomeSlamStopDetection _setStaticFence](self, "_setStaticFence");
}

- (void)_enterMotionStateAtTime:(void *)a1
{
  id v4;

  objc_msgSend(a1, "setState:", 0);
  objc_msgSend(a1, "_setLargeMotionFence");
  objc_msgSend(a1, "_setSmallMotionFence");
  objc_msgSend(a1, "_timepointToDate:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setLongMotionTimerStartingDate:");
  objc_msgSend(a1, "_setShortMotionTimerStartingDate:", v4);

}

- (void)_setStaticFence
{
  ULHomeSlamFence *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  ULHomeSlamFence *v9;
  id v10;

  v3 = [ULHomeSlamFence alloc];
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULHomeSlamStaticFenceSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v8 = v7;
  else
    v8 = &unk_2511ECD18;
  v10 = v8;

  objc_msgSend(v10, "floatValue");
  v9 = -[ULHomeSlamFence initWithFenceRadius:](v3, "initWithFenceRadius:");
  -[ULHomeSlamStopDetection setStaticFence:](self, "setStaticFence:", v9);

}

- (void)_setLargeMotionFence
{
  ULHomeSlamFence *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  ULHomeSlamFence *v9;
  id v10;

  v3 = [ULHomeSlamFence alloc];
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULHomeSlamMotionLargeFenceSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v8 = v7;
  else
    v8 = &unk_2511ED108;
  v10 = v8;

  objc_msgSend(v10, "floatValue");
  v9 = -[ULHomeSlamFence initWithFenceRadius:](v3, "initWithFenceRadius:");
  -[ULHomeSlamStopDetection setLargeFence:](self, "setLargeFence:", v9);

}

- (void)_setSmallMotionFence
{
  ULHomeSlamFence *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  ULHomeSlamFence *v9;
  id v10;

  v3 = [ULHomeSlamFence alloc];
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULHomeSlamMotionSmallFenceSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v8 = v7;
  else
    v8 = &unk_2511ECD28;
  v10 = v8;

  objc_msgSend(v10, "floatValue");
  v9 = -[ULHomeSlamFence initWithFenceRadius:](v3, "initWithFenceRadius:");
  -[ULHomeSlamStopDetection setSmallFence:](self, "setSmallFence:", v9);

}

- (void)_setLongMotionTimerStartingDate:(id)a3
{
  ULHomeSlamTimer *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  ULHomeSlamTimer *v10;
  id v11;

  v11 = a3;
  v4 = [ULHomeSlamTimer alloc];
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULHomeSlamMotionLongTimerLength");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v9 = v8;
  else
    v9 = &unk_2511ED0F0;

  objc_msgSend(v9, "doubleValue");
  v10 = -[ULHomeSlamTimer initWithTimeout:andStartTime:](v4, "initWithTimeout:andStartTime:", v11);
  -[ULHomeSlamStopDetection setLongTimer:](self, "setLongTimer:", v10);

}

- (void)_setShortMotionTimerStartingDate:(id)a3
{
  ULHomeSlamTimer *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  ULHomeSlamTimer *v10;
  id v11;

  v11 = a3;
  v4 = [ULHomeSlamTimer alloc];
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULHomeSlamMotionShortTimerLength");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v9 = v8;
  else
    v9 = &unk_2511ED0D8;

  objc_msgSend(v9, "doubleValue");
  v10 = -[ULHomeSlamTimer initWithTimeout:andStartTime:](v4, "initWithTimeout:andStartTime:", v11);
  -[ULHomeSlamStopDetection setShortTimer:](self, "setShortTimer:", v10);

}

- (uint64_t)_timepointToDate:(double)a1
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)a1);
}

- (ULDatabase)db
{
  return self->_db;
}

- (void)setDb:(ULDatabase *)a3
{
  self->_db = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (ULHomeSlamFence)largeFence
{
  return self->_largeFence;
}

- (void)setLargeFence:(id)a3
{
  objc_storeStrong((id *)&self->_largeFence, a3);
}

- (ULHomeSlamFence)smallFence
{
  return self->_smallFence;
}

- (void)setSmallFence:(id)a3
{
  objc_storeStrong((id *)&self->_smallFence, a3);
}

- (ULHomeSlamFence)staticFence
{
  return self->_staticFence;
}

- (void)setStaticFence:(id)a3
{
  objc_storeStrong((id *)&self->_staticFence, a3);
}

- (ULHomeSlamTimer)longTimer
{
  return self->_longTimer;
}

- (void)setLongTimer:(id)a3
{
  objc_storeStrong((id *)&self->_longTimer, a3);
}

- (ULHomeSlamTimer)shortTimer
{
  return self->_shortTimer;
}

- (void)setShortTimer:(id)a3
{
  objc_storeStrong((id *)&self->_shortTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortTimer, 0);
  objc_storeStrong((id *)&self->_longTimer, 0);
  objc_storeStrong((id *)&self->_staticFence, 0);
  objc_storeStrong((id *)&self->_smallFence, 0);
  objc_storeStrong((id *)&self->_largeFence, 0);
}

@end
