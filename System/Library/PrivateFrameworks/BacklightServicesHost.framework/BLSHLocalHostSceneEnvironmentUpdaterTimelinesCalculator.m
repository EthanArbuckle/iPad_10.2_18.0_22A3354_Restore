@implementation BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator

- (id)initWithDateInterval:(void *)a3 previousPresentationDate:(void *)a4 localHostEnvironment:(void *)a5 subHostedHostEnvironments:(char)a6 shouldReset:(void *)a7 osTimerProvider:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  objc_super v26;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  if (a1)
  {
    v26.receiver = a1;
    v26.super_class = (Class)BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator;
    v18 = (id *)objc_msgSendSuper2(&v26, sel_init);
    a1 = v18;
    if (v18)
    {
      *((_DWORD *)v18 + 2) = 0;
      v19 = objc_msgSend(v13, "copy");
      v20 = a1[6];
      a1[6] = (id)v19;

      v21 = objc_msgSend(v14, "copy");
      v22 = a1[7];
      a1[7] = (id)v21;

      objc_storeStrong(a1 + 8, a4);
      v23 = objc_msgSend(v16, "copy");
      v24 = a1[9];
      a1[9] = (id)v23;

      *((_BYTE *)a1 + 88) = a6;
      objc_storeStrong(a1 + 10, a7);
    }
  }

  return a1;
}

- (void)calculateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *lock_timelines;
  void *v8;
  id completion;
  NSUInteger v10;
  void *v11;
  BLSBacklightSceneEnvironment *localHostEnvironment;
  uint64_t v13;
  NSDateInterval *dateInterval;
  NSArray *subHostedHostEnvironments;
  void *v16;
  BLSHEngineRequestDatesOperation *v17;
  BLSHEngineRequestDatesOperation *lock_requestDatesOperation;
  BLSHEngineRequestDatesOperation *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];

  v4 = a3;
  if (self->_completion)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("we only support one calculation in-flight at a time"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator calculateWithCompletion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    lock_timelines = self->_lock_timelines;
    self->_lock_timelines = v6;

    v8 = (void *)MEMORY[0x2199D2BD8](v5);
    completion = self->_completion;
    self->_completion = v8;

    os_unfair_lock_lock(&self->_lock);
    v10 = -[NSArray count](self->_subHostedHostEnvironments, "count");
    if (!v10)
      self->_lock_requestDatesOperationComplete = 1;
    os_unfair_lock_unlock(&self->_lock);
    -[BLSBacklightSceneEnvironment delegate](self->_localHostEnvironment, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    localHostEnvironment = self->_localHostEnvironment;
    v13 = MEMORY[0x24BDAC760];
    dateInterval = self->_dateInterval;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __83__BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator_calculateWithCompletion___block_invoke;
    v22[3] = &unk_24D1BDF20;
    v22[4] = self;
    objc_msgSend(v11, "environment:timelinesForDateInterval:previousSpecifier:completion:", localHostEnvironment, dateInterval, 0, v22);

    if (v10)
    {
      subHostedHostEnvironments = self->_subHostedHostEnvironments;
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __83__BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator_calculateWithCompletion___block_invoke_2;
      v21[3] = &unk_24D1BDF48;
      v21[4] = self;
      -[NSArray bs_map:](subHostedHostEnvironments, "bs_map:", v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[BLSHEngineRequestDatesOperation initWithRequestInterval:delegate:osTimerProvider:]([BLSHEngineRequestDatesOperation alloc], "initWithRequestInterval:delegate:osTimerProvider:", self->_dateInterval, self, self->_osTimerProvider);
      os_unfair_lock_lock(&self->_lock);
      lock_requestDatesOperation = self->_lock_requestDatesOperation;
      self->_lock_requestDatesOperation = v17;
      v19 = v17;

      os_unfair_lock_unlock(&self->_lock);
      -[BLSHEngineRequestDatesOperation beginOperationWithIntervals:shouldReset:](v19, "beginOperationWithIntervals:shouldReset:", v16, self->_shouldReset);

    }
  }
}

uint64_t __83__BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator_calculateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObjectsFromArray:", v4);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  return objc_msgSend(*(id *)(a1 + 32), "callCompletionIfDone");
}

id __83__BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator_calculateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v4 = a2;
  objc_msgSend(v3, "alwaysOnSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForPresentationDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entrySpecifierForTimelineIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v8, "timelineEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLSHEnvironmentDateInterval intervalWithPresentationInterval:previousPresentationDate:shouldReset:environment:](BLSHEnvironmentDateInterval, "intervalWithPresentationInterval:previousPresentationDate:shouldReset:environment:", v9, v11, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 88), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)callCompletionIfDone
{
  os_unfair_lock_s *p_lock;
  BLSHEngineRequestDatesOperation *lock_requestDatesOperation;
  id completion;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_localHostEnvTimelinesComplete && self->_lock_requestDatesOperationComplete)
  {
    -[NSMutableSet allObjects](self->_lock_timelines, "allObjects");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[BLSHEngineRequestDatesOperation invalidate](self->_lock_requestDatesOperation, "invalidate");
    lock_requestDatesOperation = self->_lock_requestDatesOperation;
    self->_lock_requestDatesOperation = 0;

    os_unfair_lock_unlock(p_lock);
    (*((void (**)(void))self->_completion + 2))();
    completion = self->_completion;
    self->_completion = 0;

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)lock_completeAllTimelineEntries
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_lock_incompleteTimelineEntriesForDateInterval;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_incompleteTimelineEntriesForDateInterval, "objectForKeyedSubscript:", v8, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE0B828], "timelineWithEntries:identifier:configure:", v9, v8, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](self->_lock_timelines, "addObject:", v10);

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)requestDatesOperation:(id)a3 environment:(id)a4 didProvideSpecifiers:(id)a5 forPresentationInterval:(id)a6 isComplete:(BOOL)a7
{
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSMutableDictionary *lock_incompleteTimelineEntriesForDateInterval;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  id v19;
  id v20;

  v7 = a7;
  v10 = a4;
  objc_msgSend(a5, "bs_map:", &__block_literal_global_21);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  BLSHSubhostedEnvironmentIdentifierForEnvironment(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_incompleteTimelineEntriesForDateInterval, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v19);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v14;
  }
  else
  {
    v15 = v19;
  }
  lock_incompleteTimelineEntriesForDateInterval = self->_lock_incompleteTimelineEntriesForDateInterval;
  v20 = v15;
  if (!lock_incompleteTimelineEntriesForDateInterval)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v18 = self->_lock_incompleteTimelineEntriesForDateInterval;
    self->_lock_incompleteTimelineEntriesForDateInterval = v17;

    lock_incompleteTimelineEntriesForDateInterval = self->_lock_incompleteTimelineEntriesForDateInterval;
  }
  -[NSMutableDictionary setObject:forKey:](lock_incompleteTimelineEntriesForDateInterval, "setObject:forKey:");
  if (v7)
  {
    self->_lock_requestDatesOperationComplete = 1;
    -[BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator lock_completeAllTimelineEntries](self, "lock_completeAllTimelineEntries");
    os_unfair_lock_unlock(&self->_lock);
    -[BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator callCompletionIfDone](self, "callCompletionIfDone");
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

id __149__BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BE0B830];
  v3 = a2;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fidelity");

  objc_msgSend(v2, "entryForPresentationTime:withRequestedFidelity:animated:userObject:", v4, v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)requestDatesOperation:(id)a3 didTimeoutPendingEnvironments:(id)a4
{
  if (objc_msgSend(a3, "isComplete"))
  {
    os_unfair_lock_lock(&self->_lock);
    self->_lock_requestDatesOperationComplete = 1;
    -[BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator lock_completeAllTimelineEntries](self, "lock_completeAllTimelineEntries");
    os_unfair_lock_unlock(&self->_lock);
    -[BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator callCompletionIfDone](self, "callCompletionIfDone");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_osTimerProvider, 0);
  objc_storeStrong((id *)&self->_subHostedHostEnvironments, 0);
  objc_storeStrong((id *)&self->_localHostEnvironment, 0);
  objc_storeStrong((id *)&self->_previousPresentationDate, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_lock_requestDatesOperation, 0);
  objc_storeStrong((id *)&self->_lock_incompleteTimelineEntriesForDateInterval, 0);
  objc_storeStrong((id *)&self->_lock_timelines, 0);
}

- (void)calculateWithCompletion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
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

@end
