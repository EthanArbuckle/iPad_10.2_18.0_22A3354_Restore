@implementation BLSAlwaysOnTimelineUnconfiguredEntry

- (BLSAlwaysOnTimelineUnconfiguredEntry)initWithPresentationTime:(id)a3 requestedFidelity:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 timelineIdentifier:(id)a7 userObject:(id)a8
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  BLSAlwaysOnTimelineUnconfiguredEntry *v18;
  void *v20;
  objc_super v21;

  v11 = a5;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BLSAlwaysOnTimelineUnconfiguredEntry;
  v18 = -[BLSAlwaysOnTimelineEntry initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:](&v21, sel_initWithPresentationTime_requestedFidelity_animated_duration_timelineIdentifier_userObject_, v15, a4, v11, v16, v17, a6);
  if (v18)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[self respondsToSelector:@selector(setRequestedFidelity:)]"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[BLSAlwaysOnTimelineUnconfiguredEntry initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:].cold.1(a2);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[self respondsToSelector:@selector(setTimelineIdentifier:)]"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[BLSAlwaysOnTimelineUnconfiguredEntry initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:].cold.2(a2);
    }
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B0C7B4E8);
  }
LABEL_4:

  return v18;
}

+ (id)entryForPresentationTime:(id)a3 withRequestedFidelity:(int64_t)a4
{
  id v5;
  BLSAlwaysOnTimelineUnconfiguredEntry *v6;

  v5 = a3;
  v6 = -[BLSAlwaysOnTimelineUnconfiguredEntry initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:]([BLSAlwaysOnTimelineUnconfiguredEntry alloc], "initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:", v5, a4, 0, 0, 0, 0.2);

  return v6;
}

+ (id)entryForPresentationTime:(id)a3
{
  return (id)objc_msgSend(a1, "entryForPresentationTime:withRequestedFidelity:", a3, -1);
}

+ (id)entryForPresentationTime:(id)a3 withRequestedFidelity:(int64_t)a4 animated:(BOOL)a5 userObject:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  BLSAlwaysOnTimelineUnconfiguredEntry *v11;

  v6 = a5;
  v9 = a6;
  v10 = a3;
  v11 = -[BLSAlwaysOnTimelineUnconfiguredEntry initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:]([BLSAlwaysOnTimelineUnconfiguredEntry alloc], "initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:", v10, a4, v6, 0, v9, 0.2);

  return v11;
}

+ (id)entryForPresentationTime:(id)a3 animated:(BOOL)a4 userObject:(id)a5
{
  return (id)objc_msgSend(a1, "entryForPresentationTime:withRequestedFidelity:animated:userObject:", a3, -1, a4, a5);
}

- (void)initWithPresentationTime:(const char *)a1 requestedFidelity:animated:duration:timelineIdentifier:userObject:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_1(&dword_1B0C75000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPresentationTime:(const char *)a1 requestedFidelity:animated:duration:timelineIdentifier:userObject:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_1(&dword_1B0C75000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
