@implementation AXMetricSession

- (AXMetricSession)initWithName:(id)a3 measurementsEnabled:(BOOL)a4
{
  return -[AXMetricSession initWithName:measurementsEnabled:orEnabledByEnvironmentVariables:](self, "initWithName:measurementsEnabled:orEnabledByEnvironmentVariables:", a3, a4, 0);
}

- (AXMetricSession)initWithName:(id)a3 measurementsEnabled:(BOOL)a4 orEnabledByEnvironmentVariables:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  AXMetricSession *v10;
  AXMetricSession *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)AXMetricSession;
  v10 = -[AXMetricSession init](&v26, sel_init);
  v11 = v10;
  if (v10)
  {
    -[AXMetricSession setEnabledByEnvironmentVariables:](v10, "setEnabledByEnvironmentVariables:", v9);
    -[AXMetricSession setName:](v11, "setName:", v8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMetricSession setChildMetrics:](v11, "setChildMetrics:", v12);

    -[AXMetricSession setMeasurementsEnabled:](v11, "setMeasurementsEnabled:", v6);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "environment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v15 = v9;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v23 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v14, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              -[AXMetricSession setMeasurementsEnabled:](v11, "setMeasurementsEnabled:", 1);
              goto LABEL_13;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          if (v17)
            continue;
          break;
        }
      }
LABEL_13:

    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMetricSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  AXMetricSession *v17;
  AXMetricSession *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("measurementsEnabled"));
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("enabledByEnvironmentVariables"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("childMetrics"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[AXMetricSession initWithName:measurementsEnabled:orEnabledByEnvironmentVariables:](self, "initWithName:measurementsEnabled:orEnabledByEnvironmentVariables:", v5, v6, v10);
  v18 = v17;
  if (v17)
  {
    -[AXMetricSession childMetrics](v17, "childMetrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v16);

  }
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AXMetricSession name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AXMetricSession measurementsEnabled](self, "measurementsEnabled"), CFSTR("measurementsEnabled"));
  -[AXMetricSession enabledByEnvironmentVariables](self, "enabledByEnvironmentVariables");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("enabledByEnvironmentVariables"));

  -[AXMetricSession childMetrics](self, "childMetrics");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("childMetrics"));

}

- (void)measure:(id)a3 execute:(id)a4
{
  void (**v6)(id, id);
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, id))a4;
  if (-[AXMetricSession measurementsEnabled](self, "measurementsEnabled"))
  {
    v7 = -[AXMetric _initWithName:session:]([AXBlockMetric alloc], "_initWithName:session:", v9, self);
    -[AXMetricSession childMetrics](self, "childMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

    objc_msgSend(v7, "_startMeasurement");
    v6[2](v6, v7);

    objc_msgSend(v7, "_endMeasurement");
  }
  else
  {
    AXSharedInertMetric();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);

  }
}

- (id)measure:(id)a3 tryExecute:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (-[AXMetricSession measurementsEnabled](self, "measurementsEnabled"))
  {
    v8 = -[AXMetric _initWithName:session:]([AXBlockMetric alloc], "_initWithName:session:", v6, self);
    -[AXMetricSession childMetrics](self, "childMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

    objc_msgSend(v8, "_startMeasurement");
    v7[2](v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_endMeasurement");
  }
  else
  {
    AXSharedInertMetric();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)startMeasure:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[AXMetricSession measurementsEnabled](self, "measurementsEnabled"))
  {
    v5 = -[AXMetric _initWithName:session:]([AXBookendMetric alloc], "_initWithName:session:", v4, self);
    -[AXMetricSession childMetrics](self, "childMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

    objc_msgSend(v5, "_startMeasurement");
  }
  else
  {
    AXSharedInertMetric();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)generateReport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[AXMetricSession measurementsEnabled](self, "measurementsEnabled"))
  {
    v3 = (void *)MEMORY[0x1E0CB37A0];
    -[AXMetricSession name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Perf report for '%@':\n"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[AXMetricSession childMetrics](self, "childMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "_appendToReport:withIndentation:", v5, 1);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[AXMetricSession name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Measurements are not being collected for: '%@'"), v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSMutableArray)childMetrics
{
  return self->_childMetrics;
}

- (void)setChildMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_childMetrics, a3);
}

- (BOOL)measurementsEnabled
{
  return self->_measurementsEnabled;
}

- (void)setMeasurementsEnabled:(BOOL)a3
{
  self->_measurementsEnabled = a3;
}

- (NSArray)enabledByEnvironmentVariables
{
  return self->_enabledByEnvironmentVariables;
}

- (void)setEnabledByEnvironmentVariables:(id)a3
{
  objc_storeStrong((id *)&self->_enabledByEnvironmentVariables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledByEnvironmentVariables, 0);
  objc_storeStrong((id *)&self->_childMetrics, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
