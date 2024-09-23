@implementation AXMetric

- (id)_initWithName:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  AXMetric *v8;
  AXMetric *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AXMetric;
  v8 = -[AXMetric init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AXMetric setName:](v8, "setName:", v6);
    -[AXMetric setSession:](v9, "setSession:", v7);
    if (objc_msgSend(v7, "measurementsEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMetric setChildMetrics:](v9, "setChildMetrics:", v10);

      v9->_perfCheckSession = (pc_session *)pc_session_create();
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "processIdentifier");
      pc_session_set_procpid();

      pc_session_add_metric();
      pc_session_add_metric();
      pc_session_add_metric();
      pc_session_add_metric();
      pc_session_add_metric();
      pc_session_add_metric();
      pc_session_add_metric();
    }
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_perfCheckSession)
    pc_session_destroy();
  v3.receiver = self;
  v3.super_class = (Class)AXMetric;
  -[AXMetric dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMetric)initWithCoder:(id)a3
{
  id v4;
  AXMetric *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXMetric;
  v5 = -[AXMetric init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMetric setName:](v5, "setName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("session"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMetric setSession:](v5, "setSession:", v7);

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("childMetrics"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMetric setChildMetrics:](v5, "setChildMetrics:", v13);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startTime"));
    -[AXMetric setStartTime:](v5, "setStartTime:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("endTime"));
    -[AXMetric setEndTime:](v5, "setEndTime:");
    -[AXMetric setDirtyMemory:](v5, "setDirtyMemory:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dirtyMemory")));
    -[AXMetric setDirtyMemoryDelta:](v5, "setDirtyMemoryDelta:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dirtyMemoryDelta")));
    -[AXMetric setDirtyMemoryPeak:](v5, "setDirtyMemoryPeak:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dirtyMemoryPeak")));
    -[AXMetric setDirtyMemoryPeakDelta:](v5, "setDirtyMemoryPeakDelta:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dirtyMemoryPeakDelta")));
    -[AXMetric setDirtyMemoryPeakLifetime:](v5, "setDirtyMemoryPeakLifetime:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dirtyMemoryPeakLifetime")));
    -[AXMetric setCpuTime:](v5, "setCpuTime:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("cpuTime")));
    -[AXMetric setCpuInstructions:](v5, "setCpuInstructions:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("cpuInstructions")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AXMetric name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("name"));

  -[AXMetric childMetrics](self, "childMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("childMetrics"));

  -[AXMetric startTime](self, "startTime");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("startTime"));
  -[AXMetric endTime](self, "endTime");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("endTime"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric dirtyMemory](self, "dirtyMemory"), CFSTR("dirtyMemory"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric dirtyMemoryDelta](self, "dirtyMemoryDelta"), CFSTR("dirtyMemoryDelta"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric dirtyMemoryPeak](self, "dirtyMemoryPeak"), CFSTR("dirtyMemoryPeak"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric dirtyMemoryPeakDelta](self, "dirtyMemoryPeakDelta"), CFSTR("dirtyMemoryPeakDelta"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric dirtyMemoryPeakLifetime](self, "dirtyMemoryPeakLifetime"), CFSTR("dirtyMemoryPeakLifetime"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric cpuTime](self, "cpuTime"), CFSTR("cpuTime"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric cpuInstructions](self, "cpuInstructions"), CFSTR("cpuInstructions"));
  NSClassFromString(CFSTR("NSXPCEncoder"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[AXMetric session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeConditionalObject:forKey:", v6, CFSTR("session"));

  }
}

- (void)_startMeasurement
{
  pc_session *perfCheckSession;
  double v4;
  id v5;

  -[AXMetric session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "measurementsEnabled"))
  {
    perfCheckSession = self->_perfCheckSession;

    if (perfCheckSession)
    {
      pc_session_begin();
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      self->_startTime = v4;
    }
  }
  else
  {

  }
}

- (void)_endMeasurement
{
  pc_session *perfCheckSession;
  double v4;
  id v5;

  -[AXMetric session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "measurementsEnabled"))
  {
    perfCheckSession = self->_perfCheckSession;

    if (perfCheckSession)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      self->_endTime = v4;
      pc_session_end();
      pc_session_get_value();
      pc_session_get_value();
      pc_session_get_value();
      pc_session_get_value();
      pc_session_get_value();
      pc_session_get_value();
      pc_session_get_value();
      self->_dirtyMemory = (uint64_t)0.0;
      self->_dirtyMemoryDelta = (uint64_t)0.0;
      self->_dirtyMemoryPeak = (uint64_t)0.0;
      self->_dirtyMemoryPeakDelta = (uint64_t)0.0;
      self->_dirtyMemoryPeakLifetime = (uint64_t)0.0;
      self->_cpuTime = (uint64_t)0.0 / 0xF4240uLL;
      self->_cpuInstructions = (uint64_t)0.0;
      pc_session_destroy();
      self->_perfCheckSession = 0;
    }
  }
  else
  {

  }
}

- (double)elapsedTime
{
  return self->_endTime - self->_startTime;
}

- (id)_formatKbAsMbString:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2fMB"), (double)a3 * 0.0009765625);
}

- (id)_formatDeltaKbAsMbString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("▼");
  if (a3 > 0)
    v3 = CFSTR("▲");
  if (!a3)
    v3 = CFSTR("=");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%.2fMB"), v3, (double)a3 * 0.0009765625);
}

- (void)_appendToReport:(id)a3 withIndentation:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AXMetric session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "measurementsEnabled");

  if (v8)
  {
    objc_msgSend(&stru_1E28C88D8, "stringByPaddingToLength:withString:startingAtIndex:", 2 * a4, CFSTR(" "), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v9);

    -[AXMetric name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMetric elapsedTime](self, "elapsedTime");
    objc_msgSend(v6, "appendFormat:", CFSTR("%@: [Time:%.3fs]"), v10, v11);

    objc_msgSend(v6, "appendFormat:", CFSTR(" [CPU:%lldms istrCnt:%lld]"), -[AXMetric cpuTime](self, "cpuTime"), -[AXMetric cpuInstructions](self, "cpuInstructions"));
    -[AXMetric _formatKbAsMbString:](self, "_formatKbAsMbString:", -[AXMetric dirtyMemory](self, "dirtyMemory"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMetric _formatDeltaKbAsMbString:](self, "_formatDeltaKbAsMbString:", -[AXMetric dirtyMemoryDelta](self, "dirtyMemoryDelta"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" [Dirty Memory:%@ %@]"), v12, v13);

    -[AXMetric _formatKbAsMbString:](self, "_formatKbAsMbString:", -[AXMetric dirtyMemoryPeak](self, "dirtyMemoryPeak"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMetric _formatDeltaKbAsMbString:](self, "_formatDeltaKbAsMbString:", -[AXMetric dirtyMemoryPeakDelta](self, "dirtyMemoryPeakDelta"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" [Metric Peak:%@ %@]"), v14, v15);

    -[AXMetric _formatKbAsMbString:](self, "_formatKbAsMbString:", -[AXMetric dirtyMemoryPeakLifetime](self, "dirtyMemoryPeakLifetime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" [Global Peak:%@]\n"), v16);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[AXMetric childMetrics](self, "childMetrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      v21 = a4 + 1;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "_appendToReport:withIndentation:", v6, v21);
        }
        while (v19 != v22);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v19);
    }

  }
}

- (void)measure:(id)a3 execute:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, id))a4;
  -[AXMetric session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "measurementsEnabled") && self->_perfCheckSession)
  {
    v8 = -[AXMetric _initWithName:session:]([AXBlockMetric alloc], "_initWithName:session:", v10, v7);
    -[AXMetric childMetrics](self, "childMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

    objc_msgSend(v8, "_startMeasurement");
    v6[2](v6, v8);
    objc_msgSend(v8, "_endMeasurement");
  }
  else
  {
    AXSharedInertMetric();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);
  }

}

- (id)measure:(id)a3 tryExecute:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[AXMetric session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "measurementsEnabled") && self->_perfCheckSession)
  {
    v9 = -[AXMetric _initWithName:session:]([AXBlockMetric alloc], "_initWithName:session:", v6, v8);
    -[AXMetric childMetrics](self, "childMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v9);

    objc_msgSend(v9, "_startMeasurement");
    v7[2](v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_endMeasurement");
  }
  else
  {
    AXSharedInertMetric();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)startMeasure:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[AXMetric session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "measurementsEnabled") && self->_perfCheckSession)
  {
    v6 = -[AXMetric _initWithName:session:]([AXBookendMetric alloc], "_initWithName:session:", v4, v5);
    -[AXMetric childMetrics](self, "childMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

    objc_msgSend(v6, "_startMeasurement");
  }
  else
  {
    AXSharedInertMetric();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)measurementsEnabled
{
  void *v2;
  char v3;

  -[AXMetric session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "measurementsEnabled");

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int64_t)dirtyMemory
{
  return self->_dirtyMemory;
}

- (void)setDirtyMemory:(int64_t)a3
{
  self->_dirtyMemory = a3;
}

- (int64_t)dirtyMemoryDelta
{
  return self->_dirtyMemoryDelta;
}

- (void)setDirtyMemoryDelta:(int64_t)a3
{
  self->_dirtyMemoryDelta = a3;
}

- (int64_t)dirtyMemoryPeak
{
  return self->_dirtyMemoryPeak;
}

- (void)setDirtyMemoryPeak:(int64_t)a3
{
  self->_dirtyMemoryPeak = a3;
}

- (int64_t)dirtyMemoryPeakDelta
{
  return self->_dirtyMemoryPeakDelta;
}

- (void)setDirtyMemoryPeakDelta:(int64_t)a3
{
  self->_dirtyMemoryPeakDelta = a3;
}

- (int64_t)dirtyMemoryPeakLifetime
{
  return self->_dirtyMemoryPeakLifetime;
}

- (void)setDirtyMemoryPeakLifetime:(int64_t)a3
{
  self->_dirtyMemoryPeakLifetime = a3;
}

- (int64_t)cpuTime
{
  return self->_cpuTime;
}

- (void)setCpuTime:(int64_t)a3
{
  self->_cpuTime = a3;
}

- (int64_t)cpuInstructions
{
  return self->_cpuInstructions;
}

- (void)setCpuInstructions:(int64_t)a3
{
  self->_cpuInstructions = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (pc_session)perfCheckSession
{
  return self->_perfCheckSession;
}

- (void)setPerfCheckSession:(pc_session *)a3
{
  self->_perfCheckSession = a3;
}

- (NSMutableArray)childMetrics
{
  return self->_childMetrics;
}

- (void)setChildMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_childMetrics, a3);
}

- (AXMetricSession)session
{
  return (AXMetricSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_childMetrics, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
