@implementation FBProcessCPUStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

- (FBProcessCPUStatistics)initWithProcessHandle:(id)a3
{
  id v6;
  FBProcessCPUStatistics *v7;
  FBProcessCPUStatistics *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  NSClassFromString(CFSTR("RBSProcessHandle"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcessCPUStatistics initWithProcessHandle:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B64F8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:RBSProcessHandleClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcessCPUStatistics initWithProcessHandle:].cold.1(a2);
    goto LABEL_11;
  }

  v11.receiver = self;
  v11.super_class = (Class)FBProcessCPUStatistics;
  v7 = -[FBProcessCPUStatistics init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v7->_handle, a3);
    -[FBProcessCPUStatistics reset](v8, "reset");
  }

  return v8;
}

- (void)reset
{
  os_unfair_lock_s *p_lock;
  double v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[FBProcessCPUStatistics _hostwideUserElapsedCPUTime:systemElapsedCPUTime:idleElapsedCPUTime:](self, "_hostwideUserElapsedCPUTime:systemElapsedCPUTime:idleElapsedCPUTime:", &self->_times, &self->_times.beginSystemCPUElapsedTime, &self->_times.beginIdleCPUElapsedTime);
  -[RBSProcessHandle elapsedCPUTimeForFrontBoard](self->_handle, "elapsedCPUTimeForFrontBoard");
  self->_times.beginApplicationCPUElapsedTime = v4;
  os_unfair_lock_unlock(p_lock);
}

- (void)_hostwideUserElapsedCPUTime:(double *)a3 systemElapsedCPUTime:(double *)a4 idleElapsedCPUTime:(double *)a5
{
  host_t v8;
  kern_return_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  mach_msg_type_number_t host_info_outCnt;
  integer_t host_info_out[2];
  uint64_t v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26[2];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)host_info_out = 0;
  v21 = 0;
  host_info_outCnt = 4;
  v8 = MEMORY[0x1A85909F4](self, a2);
  v9 = host_statistics(v8, 3, host_info_out, &host_info_outCnt);
  v10 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  if (!v9)
  {
    v13 = (HIDWORD(v21) + host_info_out[0]);
    v14 = _cpuTicksToTimeInterval_microsecondsPerTick;
    if (_cpuTicksToTimeInterval_microsecondsPerTick < 1)
    {
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v22 = 20;
      *(_QWORD *)v26 = 0xC00000001;
      if (sysctl(v26, 2u, &v23, &v22, 0, 0))
      {
        v15 = _cpuTicksToTimeInterval_microsecondsPerTick;
      }
      else
      {
        v15 = HIDWORD(v23);
        _cpuTicksToTimeInterval_microsecondsPerTick = HIDWORD(v23);
      }
      v14 = v15;
      v10 = (double)(v15 * v13) / 1000000.0;
      v13 = host_info_out[1];
      if (v15 <= 0)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v22 = 20;
        *(_QWORD *)v26 = 0xC00000001;
        if (sysctl(v26, 2u, &v23, &v22, 0, 0))
        {
          v18 = _cpuTicksToTimeInterval_microsecondsPerTick;
        }
        else
        {
          v18 = HIDWORD(v23);
          _cpuTicksToTimeInterval_microsecondsPerTick = HIDWORD(v23);
        }
        v14 = v18;
        v16 = v18 * v13;
        v17 = v21;
        if (v18 <= 0)
        {
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v22 = 20;
          *(_QWORD *)v26 = 0xC00000001;
          if (sysctl(v26, 2u, &v23, &v22, 0, 0))
          {
            LODWORD(v14) = _cpuTicksToTimeInterval_microsecondsPerTick;
          }
          else
          {
            LODWORD(v14) = HIDWORD(v23);
            _cpuTicksToTimeInterval_microsecondsPerTick = HIDWORD(v23);
          }
          v14 = (int)v14;
        }
        goto LABEL_9;
      }
    }
    else
    {
      v10 = (double)(uint64_t)(_cpuTicksToTimeInterval_microsecondsPerTick
                            * (unint64_t)v13)
          / 1000000.0;
      LODWORD(v13) = host_info_out[1];
    }
    v16 = v14 * v13;
    v17 = v21;
LABEL_9:
    v11 = (double)v16 / 1000000.0;
    v12 = (double)(v14 * v17) / 1000000.0;
  }
  if (a3)
    *a3 = v10;
  if (a4)
    *a4 = v11;
  if (a5)
    *a5 = v12;
}

- (double)totalElapsedTime
{
  double result;

  -[RBSProcessHandle elapsedCPUTimeForFrontBoard](self->_handle, "elapsedCPUTimeForFrontBoard");
  return result;
}

- (double)totalElapsedUserTime
{
  os_unfair_lock_s *p_lock;
  double v5;

  v5 = 0.0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[FBProcessCPUStatistics _lock_getApplicationCPUTimesForUser:system:idle:](self, "_lock_getApplicationCPUTimesForUser:system:idle:", &v5, 0, 0);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (double)totalElapsedSystemTime
{
  os_unfair_lock_s *p_lock;
  double v5;

  v5 = 0.0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[FBProcessCPUStatistics _lock_getApplicationCPUTimesForUser:system:idle:](self, "_lock_getApplicationCPUTimesForUser:system:idle:", 0, &v5, 0);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (double)totalElapsedIdleTime
{
  os_unfair_lock_s *p_lock;
  double v5;

  v5 = 0.0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[FBProcessCPUStatistics _lock_getApplicationCPUTimesForUser:system:idle:](self, "_lock_getApplicationCPUTimesForUser:system:idle:", 0, 0, &v5);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)descriptionForCrashReport
{
  os_unfair_lock_s *p_lock;
  double v4;
  unint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v12;
  double v13;
  double v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = 0.0;
  v14 = 0.0;
  v12 = 0.0;
  -[FBProcessCPUStatistics _lock_getApplicationCPUTimesForUser:system:idle:](self, "_lock_getApplicationCPUTimesForUser:system:idle:", &v14, &v13, &v12);
  v4 = v14 + v13 + v12;
  v5 = llround((v14 + v13) * 100.0 / v4);
  -[RBSProcessHandle elapsedCPUTimeForFrontBoard](self->_handle, "elapsedCPUTimeForFrontBoard");
  v7 = v6 - self->_times.beginApplicationCPUElapsedTime;
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Elapsed total CPU time (seconds): %.3f (user %.3f, system %.3f), %i%% CPU"), v14 + v13, *(_QWORD *)&v14, *(_QWORD *)&v13, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Elapsed application CPU time (seconds): %.3f, %i%% CPU"), *(_QWORD *)&v7, llround(v7 * 100.0 / v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_lock_getApplicationCPUTimesForUser:(double *)a3 system:(double *)a4 idle:(double *)a5
{
  double beginIdleCPUElapsedTime;
  double beginSystemCPUElapsedTime;
  double v11;
  double v12;
  double v13;

  os_unfair_lock_assert_owner(&self->_lock);
  v12 = 0.0;
  v13 = 0.0;
  v11 = 0.0;
  -[FBProcessCPUStatistics _hostwideUserElapsedCPUTime:systemElapsedCPUTime:idleElapsedCPUTime:](self, "_hostwideUserElapsedCPUTime:systemElapsedCPUTime:idleElapsedCPUTime:", &v13, &v12, &v11);
  beginSystemCPUElapsedTime = self->_times.beginSystemCPUElapsedTime;
  beginIdleCPUElapsedTime = self->_times.beginIdleCPUElapsedTime;
  if (a3)
    *a3 = v13 - self->_times.beginUserCPUElapsedTime;
  if (a4)
    *a4 = v12 - beginSystemCPUElapsedTime;
  if (a5)
    *a5 = v11 - beginIdleCPUElapsedTime;
}

- (void)initWithProcessHandle:(const char *)a1 .cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
