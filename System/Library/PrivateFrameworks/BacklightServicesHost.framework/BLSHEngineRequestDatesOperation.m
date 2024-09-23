@implementation BLSHEngineRequestDatesOperation

- (BLSHEngineRequestDatesOperation)initWithRequestInterval:(id)a3 delegate:(id)a4 osTimerProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  BLSHEngineRequestDatesOperation *v12;
  BLSHEngineRequestDatesOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLSHEngineRequestDatesOperation;
  v12 = -[BLSHEngineRequestDatesOperation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestInterval, a3);
    v13->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v13->_lock_delegate, v10);
    objc_storeStrong((id *)&v13->_osTimerProvider, a5);
  }

  return v13;
}

- (void)dealloc
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval bls_shortLoggingString](self->_requestInterval, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("requestInterval"));

  v7 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_invalidated, CFSTR("invalidated"), 1);
  v8 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_begun, CFSTR("begun"), 0);
  v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_timedOut, CFSTR("timedOut"), 1);
  v10 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_complete, CFSTR("complete"), 1);
  if (self->_lock_begun)
    v11 = (id)objc_msgSend(v4, "appendBool:withName:", self->_lock_didReset, CFSTR("reset"));
  BSContinuousMachTimeNow();
  v13 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("elapsed"), 3, v12 - self->_lock_beginTime);
  v14 = (id)objc_msgSend(v4, "appendInteger:withName:", -[NSMutableSet count](self->_lock_pendingEnvironments, "count"), CFSTR("pendingCount"));
  -[NSMutableSet anyObject](self->_lock_pendingEnvironments, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v15, CFSTR("onePending"), 1);

  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", self->_lock_environmentIdentifiers, CFSTR("environments"), 1);
  objc_msgSend(v4, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v17;
}

- (NSString)debugDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval bls_shortLoggingString](self->_requestInterval, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("requestInterval"));

  v7 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_invalidated, CFSTR("invalidated"), 1);
  v8 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_begun, CFSTR("begun"), 0);
  v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_timedOut, CFSTR("timedOut"), 1);
  v10 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_complete, CFSTR("complete"), 1);
  if (self->_lock_begun)
    v11 = (id)objc_msgSend(v4, "appendBool:withName:", self->_lock_didReset, CFSTR("reset"));
  BSContinuousMachTimeNow();
  v13 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("elapsed"), 3, v12 - self->_lock_beginTime);
  objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "formatDuration:", self->_lock_averageInterval);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v4, "appendObject:withName:", v15, CFSTR("averageInterval"));

  if (self->_lock_shortestInterval != self->_lock_averageInterval)
  {
    objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "formatDuration:", self->_lock_shortestInterval);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v4, "appendObject:withName:", v18, CFSTR("shortestInterval"));

    objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "formatDuration:", self->_lock_longestInterval);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v4, "appendObject:withName:", v21, CFSTR("longestInterval"));

  }
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", self->_lock_environmentIdentifiers, CFSTR("environments"), 1);
  -[NSMutableSet allObjects](self->_lock_pendingEnvironments, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v23, CFSTR("pending"), 1);

  objc_msgSend(v4, "build");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v24;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  BLSAssertion *lock_flipbookPowerSavingAssertion;
  BSTimerScheduleQuerying *lock_timeoutTimer;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  -[BLSAssertion invalidate](self->_lock_flipbookPowerSavingAssertion, "invalidate");
  lock_flipbookPowerSavingAssertion = self->_lock_flipbookPowerSavingAssertion;
  self->_lock_flipbookPowerSavingAssertion = 0;

  -[BSTimerScheduleQuerying invalidate](self->_lock_timeoutTimer, "invalidate");
  lock_timeoutTimer = self->_lock_timeoutTimer;
  self->_lock_timeoutTimer = 0;

  objc_storeWeak((id *)&self->_lock_delegate, 0);
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isComplete
{
  BLSHEngineRequestDatesOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_complete;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSArray)environmentIdentifiers
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_environmentIdentifiers;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unsigned)environmentCount
{
  BLSHEngineRequestDatesOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_lock_environmentCount;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (double)shortestInterval
{
  os_unfair_lock_s *p_lock;
  double lock_shortestInterval;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_shortestInterval = self->_lock_shortestInterval;
  os_unfair_lock_unlock(p_lock);
  return lock_shortestInterval;
}

- (double)averageInterval
{
  os_unfair_lock_s *p_lock;
  double lock_averageInterval;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_averageInterval = self->_lock_averageInterval;
  os_unfair_lock_unlock(p_lock);
  return lock_averageInterval;
}

- (double)longestInterval
{
  os_unfair_lock_s *p_lock;
  double lock_longestInterval;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_longestInterval = self->_lock_longestInterval;
  os_unfair_lock_unlock(p_lock);
  return lock_longestInterval;
}

- (BOOL)didReset
{
  BLSHEngineRequestDatesOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_didReset;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSDate)beginDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_beginDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)beginTimestamp
{
  os_unfair_lock_s *p_lock;
  double lock_beginTime;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_beginTime = self->_lock_beginTime;
  os_unfair_lock_unlock(p_lock);
  return lock_beginTime;
}

- (void)beginOperationWithIntervals:(id)a3 shouldReset:(BOOL)a4
{
  id v6;
  double v7;
  NSDate *v8;
  NSDate *lock_beginDate;
  NSMutableSet *v10;
  NSMutableSet *lock_pendingEnvironments;
  void *v12;
  void *v13;
  void *v14;
  BLSAssertion *v15;
  BLSAssertion *lock_flipbookPowerSavingAssertion;
  NSArray *v17;
  NSArray *lock_environmentIdentifiers;
  id v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  void *v31;
  uint64_t lock_environmentCount;
  unint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const char *v51;
  _QWORD v53[4];
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  BLSHEngineRequestDatesOperation *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _QWORD v72[4];

  v72[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_begun)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_begun"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHEngineRequestDatesOperation beginOperationWithIntervals:shouldReset:].cold.4(a2);
    objc_msgSend(objc_retainAutorelease(v47), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145ECEF4);
  }
  v51 = a2;
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_invalidated"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHEngineRequestDatesOperation beginOperationWithIntervals:shouldReset:].cold.3(a2);
    objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145ECF58);
  }
  BSContinuousMachTimeNow();
  self->_lock_beginTime = v7;
  -[BLSHOSTimerProviding now](self->_osTimerProvider, "now");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lock_beginDate = self->_lock_beginDate;
  self->_lock_beginDate = v8;

  self->_lock_begun = 1;
  self->_lock_didReset = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  lock_pendingEnvironments = self->_lock_pendingEnvironments;
  self->_lock_pendingEnvironments = v10;

  if (!self->_lock_flipbookPowerSavingAssertion)
  {
    v12 = (void *)MEMORY[0x24BE0B838];
    +[BLSHDisableFlipbookPowerSavingAttribute disablePowerSavingForReason:](BLSHDisableFlipbookPowerSavingAttribute, "disablePowerSavingForReason:", 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "acquireWithExplanation:observer:attributes:", CFSTR("RequestDates"), 0, v14);
    v15 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
    lock_flipbookPowerSavingAssertion = self->_lock_flipbookPowerSavingAssertion;
    self->_lock_flipbookPowerSavingAssertion = v15;

  }
  self->_lock_environmentCount = 0;
  self->_lock_shortestInterval = 1.79769313e308;
  self->_lock_longestInterval = 0.0;
  objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_14);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lock_environmentIdentifiers = self->_lock_environmentIdentifiers;
  self->_lock_environmentIdentifiers = v17;

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v19 = v6;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v61;
    v22 = 0.0;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v61 != v21)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v24, "environment");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v24, "presentationInterval");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "duration");
          v29 = v28;

          ++self->_lock_environmentCount;
          if (v29 < self->_lock_shortestInterval)
            self->_lock_shortestInterval = v29;
          if (v29 > self->_lock_longestInterval)
            self->_lock_longestInterval = v29;
          -[NSMutableSet addObject:](self->_lock_pendingEnvironments, "addObject:", v26);
          v22 = v22 + v29;
        }
        else
        {
          bls_flipbook_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v24, "environment");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v66 = self;
            v67 = 2114;
            v68 = v24;
            v69 = 2114;
            v70 = v31;
            _os_log_error_impl(&dword_2145AC000, v30, OS_LOG_TYPE_ERROR, "%p nil environment identifier for interval:%{public}@ environment:%{public}@", buf, 0x20u);

          }
        }

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    }
    while (v20);
  }
  else
  {
    v22 = 0.0;
  }

  lock_environmentCount = self->_lock_environmentCount;
  if (-[NSArray count](self->_lock_environmentIdentifiers, "count") != lock_environmentCount)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_environmentCount == [_lock_environmentIdentifiers count]"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHEngineRequestDatesOperation beginOperationWithIntervals:shouldReset:].cold.2(v51);
    objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145ECFBCLL);
  }
  if (!-[NSMutableSet count](self->_lock_pendingEnvironments, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_lock_pendingEnvironments count] > 0"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHEngineRequestDatesOperation beginOperationWithIntervals:shouldReset:].cold.1(v51);
    objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145ED020);
  }
  LODWORD(v33) = self->_lock_environmentCount;
  self->_lock_averageInterval = v22 / (double)v33;
  os_unfair_lock_unlock(&self->_lock);
  -[BLSHEngineRequestDatesOperation scheduleTimeout]((uint64_t)self);
  objc_initWeak((id *)buf, self);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v34 = v19;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v57 != v36)
          objc_enumerationMutation(v34);
        v38 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        objc_msgSend(v38, "environment");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40 == 0;

        if (!v41)
        {
          objc_msgSend(v38, "environment");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "presentationInterval");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "previousPresentationDate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (a4)
            v45 = 1;
          else
            v45 = objc_msgSend(v38, "shouldReset");
          v53[0] = MEMORY[0x24BDAC760];
          v53[1] = 3221225472;
          v53[2] = __75__BLSHEngineRequestDatesOperation_beginOperationWithIntervals_shouldReset___block_invoke_52;
          v53[3] = &unk_24D1BD790;
          objc_copyWeak(&v55, (id *)buf);
          v46 = v42;
          v54 = v46;
          objc_msgSend(v46, "requestDateSpecifiersForDateInterval:previousPresentationDate:shouldReset:completion:", v43, v44, v45, v53);

          objc_destroyWeak(&v55);
        }
      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v35);
  }

  objc_destroyWeak((id *)buf);
}

id __75__BLSHEngineRequestDatesOperation_beginOperationWithIntervals_shouldReset___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)scheduleTimeout
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_initWeak(&location, (id)a1);
    v3 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BE0BE08], "descriptionForObject:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__BLSHEngineRequestDatesOperation_scheduleTimeout__block_invoke;
    v7[3] = &unk_24D1BD148;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "scheduledTimerWithIdentifier:interval:leewayInterval:handler:", v4, v7, 15.0, 2.0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v5;

    os_unfair_lock_unlock(v2);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __75__BLSHEngineRequestDatesOperation_beginOperationWithIntervals_shouldReset___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  -[BLSHEngineRequestDatesOperation environment:didProvideSpecifiers:forPresentationInterval:]((uint64_t)WeakRetained, *(void **)(a1 + 32), v6, v7);

}

- (void)environment:(void *)a3 didProvideSpecifiers:(void *)a4 forPresentationInterval:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id to;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(_BYTE *)(a1 + 116)
      || *(_BYTE *)(a1 + 115)
      || (v10 = *(void **)(a1 + 24),
          objc_msgSend(v7, "identifier"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "removeObject:", v11),
          v11,
          v12 = objc_msgSend(*(id *)(a1 + 24), "count"),
          *(_BYTE *)(a1 + 112) = v12 == 0,
          v12))
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      v15 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

      v13 = 1;
    }
    objc_copyWeak(&to, (id *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v14 = objc_loadWeakRetained(&to);
    objc_msgSend(v14, "requestDatesOperation:environment:didProvideSpecifiers:forPresentationInterval:isComplete:", a1, v7, v8, v9, v13);

    objc_destroyWeak(&to);
  }

}

- (id)telemetryDataWithEndTime:(double)a3
{
  os_unfair_lock_s *p_lock;
  BLSHFlipbookRequestDatesTelemetryData *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[BLSHFlipbookRequestDatesTelemetryData initWithTimestamp:environmentIdentifiers:shortestInterval:averageInterval:longestInterval:completionDuration:didReset:timedOutCount:]([BLSHFlipbookRequestDatesTelemetryData alloc], "initWithTimestamp:environmentIdentifiers:shortestInterval:averageInterval:longestInterval:completionDuration:didReset:timedOutCount:", self->_lock_environmentIdentifiers, self->_lock_didReset, -[NSMutableSet count](self->_lock_pendingEnvironments, "count"), a3, self->_lock_shortestInterval, self->_lock_averageInterval, self->_lock_longestInterval, a3 - self->_lock_beginTime);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

void __50__BLSHEngineRequestDatesOperation_scheduleTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[BLSHEngineRequestDatesOperation timeoutTimerFired]((uint64_t)WeakRetained);

}

- (void)timeoutTimerFired
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_2145AC000, v0, OS_LOG_TYPE_DEBUG, "%p request dates operation did not complete after ~15 seconds (+leeway), (invalidated), pending environments:%{public}@ ", v1, 0x16u);
}

- (NSDateInterval)requestInterval
{
  return self->_requestInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInterval, 0);
  objc_storeStrong((id *)&self->_lock_beginDate, 0);
  objc_storeStrong((id *)&self->_lock_environmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_osTimerProvider, 0);
  objc_destroyWeak((id *)&self->_lock_delegate);
  objc_storeStrong((id *)&self->_lock_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_lock_pendingEnvironments, 0);
  objc_storeStrong((id *)&self->_lock_flipbookPowerSavingAssertion, 0);
}

- (void)beginOperationWithIntervals:(const char *)a1 shouldReset:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)beginOperationWithIntervals:(const char *)a1 shouldReset:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)beginOperationWithIntervals:(const char *)a1 shouldReset:.cold.3(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_13();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)beginOperationWithIntervals:(const char *)a1 shouldReset:.cold.4(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_13();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
