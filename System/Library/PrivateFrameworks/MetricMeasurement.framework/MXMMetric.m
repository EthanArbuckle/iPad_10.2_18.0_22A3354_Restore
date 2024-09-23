@implementation MXMMetric

- (MXMInstrument)instrument
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMInstrument instrumentWithInstrumentals:](MXMInstrument, "instrumentWithInstrumentals:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MXMInstrument *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)build
{
  return self->_build;
}

- (BOOL)_shouldAlwaysWrapInProxy
{
  return 0;
}

- (BOOL)_shouldNeverWrapInProxy
{
  return 0;
}

- (BOOL)_shouldWrapInProxy
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[MXMMetric _shouldConstructProbe](self, "_shouldConstructProbe"))
    return 0;
  -[MXMMetric _constructProbe](self, "_constructProbe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = v3;
  objc_msgSend(v3, "setFilter:", self->_filter);
  objc_msgSend(v4, "sampleWithTimeout:", 60.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSets") == 0;

  return v6;
}

- (BOOL)_shouldConstructProbe
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Abstract Method"), CFSTR("Subclass must implement"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)_constructProbe
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Abstract Method"), CFSTR("Subclass must implement"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)_getProbe
{
  MXMProbe *v3;
  MXMProbe *v4;
  MXMProbe *probe;
  MXMProbe *v6;

  if (-[MXMMetric _shouldConstructProbe](self, "_shouldConstructProbe"))
  {
    v3 = self->_probe;
    objc_sync_enter(v3);
    if (!self->_probe)
    {
      -[MXMMetric _constructProbe](self, "_constructProbe");
      v4 = (MXMProbe *)objc_claimAutoreleasedReturnValue();
      probe = self->_probe;
      self->_probe = v4;

      -[MXMProbe setFilter:](self->_probe, "setFilter:", self->_filter);
      -[MXMProbe setDelegate:](self->_probe, "setDelegate:", self);
    }
    objc_sync_exit(v3);

    v6 = self->_probe;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)copy
{
  return -[MXMMetric copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc((Class)objc_opt_class());
  -[MXMMetric identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[MXMMetric filter](self, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = (void *)objc_msgSend(v5, "initWithIdentifier:filter:", v7, v9);

  objc_msgSend(v10, "setPreferredSampleMode:", -[MXMMetric preferredSampleMode](self, "preferredSampleMode"));
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MXMMetric identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("Identifier"));

  -[MXMMetric version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("Version"));

  -[MXMMetric build](self, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("Build"));

  -[MXMMetric filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("Filter"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[MXMMetric preferredSampleMode](self, "preferredSampleMode"), CFSTR("SuggestedPollMode"));
}

- (MXMMetric)initWithCoder:(id)a3
{
  id v4;
  MXMMetric *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *version;
  uint64_t v10;
  NSString *build;
  uint64_t v12;
  MXMSampleFilter *filter;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MXMMetric;
  v5 = -[MXMMetric init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Version"));
    v8 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Build"));
    v10 = objc_claimAutoreleasedReturnValue();
    build = v5->_build;
    v5->_build = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Filter"));
    v12 = objc_claimAutoreleasedReturnValue();
    filter = v5->_filter;
    v5->_filter = (MXMSampleFilter *)v12;

    v5->_preferredSampleMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SuggestedPollMode"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MXMMetric)initWithIdentifier:(id)a3 filter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MXMMetric *v9;
  NSString *v10;
  NSString *identifier;
  void *v12;
  NSString *v13;
  NSString *version;
  void *v15;
  NSString *v16;
  NSString *build;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v19.receiver = self;
    v19.super_class = (Class)MXMMetric;
    v9 = -[MXMMetric init](&v19, sel_init);
    self = v9;
    if (v9)
    {
      v9->_preferredSampleMode = -1;
      v10 = (NSString *)objc_msgSend(v6, "copy");
      identifier = self->_identifier;
      self->_identifier = v10;

      objc_msgSend(v8, "infoDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CFBundleShortVersionString"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      version = self->_version;
      self->_version = v13;

      objc_msgSend(v8, "infoDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      build = self->_build;
      self->_build = v16;

      objc_storeStrong((id *)&self->_filter, a4);
    }
  }

  return self;
}

- (MXMMetric)initWithIdentifier:(id)a3
{
  return -[MXMMetric initWithIdentifier:filter:](self, "initWithIdentifier:filter:", a3, 0);
}

- (void)probeDidUpdate:(id)a3 data:(id)a4 stop:(BOOL *)a5
{
  MXMMutableSampleData *data;

  data = self->_data;
  if (data)
    -[MXMMutableSampleData appendData:](data, "appendData:", a4);
}

- (BOOL)prepareWithOptions:(id)a3 error:(id *)a4
{
  MXMMutableSampleData *v5;
  MXMMutableSampleData *data;

  if (-[MXMMetric _shouldConstructProbe](self, "_shouldConstructProbe", a3, a4))
  {
    v5 = objc_alloc_init(MXMMutableSampleData);
    data = self->_data;
    self->_data = v5;
  }
  else
  {
    data = self->_data;
    self->_data = 0;
  }

  return 0;
}

- (void)willStartAtEstimatedTime:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  MXMProxyMetric *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  MXMMetric *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (((-[MXMMetric _sampleMode](self, "_sampleMode", a3) & 1) != 0
     || (-[MXMMetric _sampleMode](self, "_sampleMode") & 4) != 0)
    && -[MXMMetric _shouldConstructProbe](self, "_shouldConstructProbe"))
  {
    -[MXMMetric _getProbe](self, "_getProbe");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMMetric.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("probe"));

    }
    if ((-[MXMMetric _sampleMode](self, "_sampleMode") & 1) != 0)
    {
      if ((-[MXMMetric _sampleMode](self, "_sampleMode") & 4) != 0)
      {
        objc_msgSend(v5, "updateNowUntilStopped");
      }
      else
      {
        if (-[MXMMetric _shouldAlwaysWrapInProxy](self, "_shouldAlwaysWrapInProxy"))
        {
          v6 = 0;
        }
        else
        {
          objc_msgSend(v5, "sampleWithTimeout:", 60.0);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (!objc_msgSend(v6, "numberOfSets") && !-[MXMMetric _shouldNeverWrapInProxy](self, "_shouldNeverWrapInProxy"))
        {
          _MXMGetLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            -[MXMMetric identifier](self, "identifier");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v14 = v8;
            v15 = 2048;
            v16 = self;
            _os_log_impl(&dword_214474000, v7, OS_LOG_TYPE_DEFAULT, "Metric: %@(%p) is being wrapped in a proxy in willStartAtEstimatedTime:", buf, 0x16u);

          }
          +[MXMProxyServiceManager shared](MXMProxyServiceManager, "shared");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[MXMProxyMetric initWithMetric:]([MXMProxyMetric alloc], "initWithMetric:", self);
          objc_msgSend(v9, "_sampleWithProxyMetric:timeout:stopReason:", v10, 0, 60.0);
          v11 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v11;
        }
        -[MXMMutableSampleData appendData:](self->_data, "appendData:", v6);

      }
    }

  }
}

- (void)didStopAtTime:(unint64_t)a3 stopDate:(id)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  MXMProxyMetric *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  MXMSampleAttributeFilter *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MXMSampleAttributeFilter *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  MXMMetric *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (((-[MXMMetric _sampleMode](self, "_sampleMode", a3, a4) & 2) != 0
     || (-[MXMMetric _sampleMode](self, "_sampleMode") & 4) != 0)
    && -[MXMMetric _shouldConstructProbe](self, "_shouldConstructProbe"))
  {
    -[MXMMetric _getProbe](self, "_getProbe");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMMetric.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("probe"));

    }
    if ((-[MXMMetric _sampleMode](self, "_sampleMode") & 2) != 0)
    {
      if ((-[MXMMetric _sampleMode](self, "_sampleMode") & 4) != 0)
      {
        objc_msgSend(v6, "updateNowUntilTimeout:", 60.0);
        objc_msgSend(v6, "stopUpdates");
        objc_msgSend(v6, "waitUntilStoppedWithTimeout:", 60.0);
      }
      else
      {
        if (-[MXMMetric _shouldAlwaysWrapInProxy](self, "_shouldAlwaysWrapInProxy"))
        {
          v7 = 0;
        }
        else
        {
          objc_msgSend(v6, "sampleWithTimeout:", 60.0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (!objc_msgSend(v7, "numberOfSets") && !-[MXMMetric _shouldNeverWrapInProxy](self, "_shouldNeverWrapInProxy"))
        {
          _MXMGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            -[MXMMetric identifier](self, "identifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v25 = v9;
            v26 = 2048;
            v27 = self;
            _os_log_impl(&dword_214474000, v8, OS_LOG_TYPE_DEFAULT, "Metric: %@(%p) is being wrapped in a proxy in didStopAtTime:stopDate:", buf, 0x16u);

          }
          +[MXMProxyServiceManager shared](MXMProxyServiceManager, "shared");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[MXMProxyMetric initWithMetric:]([MXMProxyMetric alloc], "initWithMetric:", self);
          objc_msgSend(v10, "_sampleWithProxyMetric:timeout:stopReason:", v11, 0, 60.0);
          v12 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v12;
        }
        if (v7
          && (objc_msgSend(v7, "samples"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "count"),
              v13,
              v14))
        {
          v15 = [MXMSampleAttributeFilter alloc];
          objc_msgSend(v7, "samples");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lastObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "attributeWithName:", CFSTR("Process Identifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "numericValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[MXMSampleAttributeFilter initWithAttributeName:numericValue:](v15, "initWithAttributeName:numericValue:", CFSTR("Process Identifier"), v19);

        }
        else
        {
          v20 = -[MXMSampleAttributeFilter initWithAttributeName:numericValue:]([MXMSampleAttributeFilter alloc], "initWithAttributeName:numericValue:", CFSTR("Process Identifier"), &unk_24D19CA18);
        }
        -[MXMMetric filter](self, "filter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addAttributeFilters:", v22);

        -[MXMMutableSampleData appendData:](self->_data, "appendData:", v7);
      }
    }

  }
}

- (void)didStopAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 stopDate:(id)a5
{
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  MXMProxyMetric *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  MXMMetric *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (((-[MXMMetric _sampleMode](self, "_sampleMode", a3, a4, a5) & 2) != 0
     || (-[MXMMetric _sampleMode](self, "_sampleMode") & 4) != 0)
    && -[MXMMetric _shouldConstructProbe](self, "_shouldConstructProbe"))
  {
    -[MXMMetric _getProbe](self, "_getProbe");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMMetric.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("probe"));

    }
    if ((-[MXMMetric _sampleMode](self, "_sampleMode") & 2) != 0)
    {
      if ((-[MXMMetric _sampleMode](self, "_sampleMode") & 4) != 0)
      {
        objc_msgSend(v7, "updateNowUntilTimeout:", 60.0);
        objc_msgSend(v7, "stopUpdates");
        objc_msgSend(v7, "waitUntilStoppedWithTimeout:", 60.0);
      }
      else
      {
        if (-[MXMMetric _shouldAlwaysWrapInProxy](self, "_shouldAlwaysWrapInProxy"))
        {
          v8 = 0;
        }
        else
        {
          objc_msgSend(v7, "sampleWithTimeout:", 60.0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (!objc_msgSend(v8, "numberOfSets") && !-[MXMMetric _shouldNeverWrapInProxy](self, "_shouldNeverWrapInProxy"))
        {
          _MXMGetLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            -[MXMMetric identifier](self, "identifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v16 = v10;
            v17 = 2048;
            v18 = self;
            _os_log_impl(&dword_214474000, v9, OS_LOG_TYPE_DEFAULT, "Metric: %@(%p) is being wrapped in a proxy in didStopAtTime:stopDate:", buf, 0x16u);

          }
          +[MXMProxyServiceManager shared](MXMProxyServiceManager, "shared");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[MXMProxyMetric initWithMetric:]([MXMProxyMetric alloc], "initWithMetric:", self);
          objc_msgSend(v11, "_sampleWithProxyMetric:timeout:stopReason:", v12, 0, 60.0);
          v13 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v13;
        }
        -[MXMMutableSampleData appendData:](self->_data, "appendData:", v8);

      }
    }

  }
}

- (BOOL)harvestData:(id *)a3 error:(id *)a4
{
  void *v7;
  MXMMutableSampleData *data;
  MXMMutableSampleData *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (!-[MXMMetric _shouldConstructProbe](self, "_shouldConstructProbe", a3, a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMMetric.m"), 275, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _shouldConstructProbe]"));

  }
  if (-[MXMMetric _shouldNeverWrapInProxy](self, "_shouldNeverWrapInProxy"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMMetric.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![self _shouldNeverWrapInProxy]"));

  }
  -[MXMMetric _getProbe](self, "_getProbe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (a3)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMMetric.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _getProbe]"));

    if (a3)
      goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMMetric.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

LABEL_7:
  data = self->_data;
  if (!data)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMMetric.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_data"));

    data = self->_data;
  }
  *a3 = objc_retainAutorelease(data);
  v9 = self->_data;
  self->_data = 0;

  return 0;
}

- (MXMSampleFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (unint64_t)preferredSampleMode
{
  return self->_preferredSampleMode;
}

- (void)setPreferredSampleMode:(unint64_t)a3
{
  self->_preferredSampleMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_probe, 0);
}

@end
