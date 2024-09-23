@implementation ARCoachingHeuristicTracking

- (int64_t)requirements
{
  return self->_requirements;
}

- (BOOL)satisfied
{
  return self->_requirements == 0;
}

- (void)updateWithFrame:(id)a3 cache:(id)a4
{
  id v5;
  int64_t requirements;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  const char *v15;
  objc_class *v16;
  int v17;
  void *v18;
  __int16 v19;
  ARCoachingHeuristicTracking *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  requirements = self->_requirements;
  objc_msgSend(v5, "camera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "trackingState");

  if (v8 == 2)
  {
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "camera");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "trackingStateReason");

  if (v11 != 2)
  {
    v9 = 1;
LABEL_8:
    self->_requirements = v9;
    if (requirements == 32)
    {
      _ARLogCoaching_3();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v14;
        v19 = 2048;
        v20 = self;
        v15 = "%{public}@ <%p>: Motion is no longer excessive";
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  self->_requirements = 32;
  if (requirements != 32)
  {
    _ARLogCoaching_3();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2048;
      v20 = self;
      v15 = "%{public}@ <%p>: Motion became excessive";
LABEL_11:
      _os_log_impl(&dword_1DCC73000, v12, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v17, 0x16u);

    }
LABEL_12:

  }
LABEL_13:

}

@end
