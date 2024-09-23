@implementation NWActivityClientMetricStatistics

- (NSUUID)activityUUID
{
  id v3;
  NSUUID *v4;
  NSUUID *activityUUID;
  _BYTE v7[5272];
  unsigned __int8 v8[5272];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_activityUUID)
  {
    -[NWActivityClientMetricStatistics report](self, "report");
    if (!uuid_is_null(v8))
    {
      v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[NWActivityClientMetricStatistics report](self, "report");
      v4 = (NSUUID *)objc_msgSend(v3, "initWithUUIDBytes:", v7);
      activityUUID = self->_activityUUID;
      self->_activityUUID = v4;

    }
  }
  return self->_activityUUID;
}

- (NSString)clientMetricName
{
  void *v2;
  _QWORD v4[658];

  v4[657] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[NWActivityClientMetricStatistics report](self, "report");
  objc_msgSend(v2, "stringWithCString:encoding:", v4, 134217984);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setClientMetricName:(id)a3
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  char v7[5256];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x1E0C80A78](self);
  v14 = *MEMORY[0x1E0C80C00];
  v5 = v4;
  if (gLogDatapath)
  {
    __nwlog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v9 = "-[NWActivityClientMetricStatistics setClientMetricName:]";
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_182FBE000, v6, OS_LOG_TYPE_DEBUG, "%{public}s Set clientMetricName to %@ for %@", buf, 0x20u);
    }

  }
  objc_msgSend(v3, "report");
  strlcpy(v7, (const char *)objc_msgSend(v5, "UTF8String"), 0x100uLL);

}

- (NSString)clientMetricString
{
  void *v2;
  void *v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t *v11;
  uint64_t v12;

  v2 = (void *)MEMORY[0x1E0C80A78](self);
  v12 = *MEMORY[0x1E0C80C00];
  if (gLogDatapath)
  {
    __nwlog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "report");
      *(_DWORD *)buf = 136446466;
      v9 = "-[NWActivityClientMetricStatistics clientMetricString]";
      v10 = 2080;
      v11 = &v7;
      _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEBUG, "%{public}s Client metric C string: %s", buf, 0x16u);
    }

  }
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "report");
  objc_msgSend(v3, "stringWithCString:encoding:", &v6, 134217984);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setClientMetricString:(id)a3
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  char v7[5000];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x1E0C80A78](self);
  v14 = *MEMORY[0x1E0C80C00];
  v5 = v4;
  if (gLogDatapath)
  {
    __nwlog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v9 = "-[NWActivityClientMetricStatistics setClientMetricString:]";
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_182FBE000, v6, OS_LOG_TYPE_DEBUG, "%{public}s Set clientMetricString to %@ for %@", buf, 0x20u);
    }

  }
  objc_msgSend(v3, "report");
  strlcpy(v7, (const char *)objc_msgSend(v5, "UTF8String"), 0x1388uLL);

}

- (NSDictionary)clientMetric
{
  void *v2;
  id v3;
  size_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  NSObject *v16;
  char v17[5272];
  char v18[5272];
  _QWORD v19[626];

  v2 = (void *)MEMORY[0x1E0C80A78](self);
  v19[625] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(v2, "report");
  objc_msgSend(v2, "report");
  if (strlen(v18) >> 3 > 0x270)
  {
    v4 = 5000;
  }
  else
  {
    objc_msgSend(v2, "report");
    v4 = strlen(v17);
  }
  v5 = (void *)objc_msgSend(v3, "initWithBytesNoCopy:length:freeWhenDone:", v19, v4, 0);
  if (v5)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v12);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        v14 = "-[NWActivityClientMetricStatistics clientMetric]";
        _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_DEBUG, "%{public}s Client metric is valid JSON", buf, 0xCu);
      }

      v6 = v6;
      v9 = v6;
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v14 = "-[NWActivityClientMetricStatistics clientMetric]";
        v15 = 2112;
        v16 = v7;
        _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_DEBUG, "%{public}s Client metric is not valid JSON: %@", buf, 0x16u);
      }

      v9 = 0;
    }

  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      v14 = "-[NWActivityClientMetricStatistics clientMetric]";
      _os_log_impl(&dword_182FBE000, v7, OS_LOG_TYPE_DEBUG, "%{public}s Failed to create clientMetric data", buf, 0xCu);
    }
    v9 = 0;
  }

  return (NSDictionary *)v9;
}

- (NSDictionary)dictionaryRepresentation
{
  NSDictionary *dictionaryRepresentation;
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSDictionary *v17;
  int v19;
  const char *v20;
  __int16 v21;
  NSDictionary *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  dictionaryRepresentation = self->_dictionaryRepresentation;
  if (!dictionaryRepresentation)
  {
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NWActivityClientMetricStatistics clientMetricName](self, "clientMetricName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NWActivityClientMetricStatistics clientMetricName](self, "clientMetricName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v6, CFSTR("name"));

    }
    -[NWActivityClientMetricStatistics clientMetric](self, "clientMetric");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v7, CFSTR("metric"));
    -[NWActivityClientMetricStatistics bundleID](self, "bundleID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[NWActivityClientMetricStatistics bundleID](self, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        -[NWActivityClientMetricStatistics bundleID](self, "bundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v12, CFSTR("bundleID"));

      }
    }
    -[NWActivityClientMetricStatistics externallyVisibleActivityUUID](self, "externallyVisibleActivityUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NWActivityClientMetricStatistics externallyVisibleActivityUUID](self, "externallyVisibleActivityUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v15, CFSTR("activityUUID"));

    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v19 = 136446466;
      v20 = "-[NWActivityClientMetricStatistics dictionaryRepresentation]";
      v21 = 2114;
      v22 = v4;
      _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_DEBUG, "%{public}s Generated nw_activity client metric report: %{public}@", (uint8_t *)&v19, 0x16u);
    }

    v17 = self->_dictionaryRepresentation;
    self->_dictionaryRepresentation = v4;

    dictionaryRepresentation = self->_dictionaryRepresentation;
  }
  return dictionaryRepresentation;
}

- (NSData)metricData
{
  NSData *metricData;
  void *v4;
  NSData *v5;
  id v6;
  NSData *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  NWActivityClientMetricStatistics *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  metricData = self->_metricData;
  if (!metricData)
  {
    -[NWActivityClientMetricStatistics dictionaryRepresentation](self, "dictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v4))
    {
      v9 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, &v9);
      v5 = (NSData *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      if (v6 || !v5)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (NSData *)(id)gLogObj;
        if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136446466;
          v11 = "-[NWActivityClientMetricStatistics metricData]";
          v12 = 2112;
          v13 = self;
          _os_log_impl(&dword_182FBE000, &v7->super, OS_LOG_TYPE_DEBUG, "%{public}s Failed to serialize client metric %@", buf, 0x16u);
        }
      }
      else
      {
        v5 = v5;
        v6 = 0;
        v7 = self->_metricData;
        self->_metricData = v5;
      }

    }
    metricData = self->_metricData;
  }
  return metricData;
}

- (NWActivityClientMetricStatistics)initWithNWActivityClientMetricReport:(nw_activity_client_metric_report_s *)a3 length:(unint64_t)a4
{
  const void *v4;
  uint64_t v5;
  void *v6;
  NWActivityClientMetricStatistics *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  _BYTE __dst[5272];
  uint64_t v18;

  v6 = (void *)MEMORY[0x1E0C80A78](self);
  v18 = *MEMORY[0x1E0C80C00];
  if (v5 == 5272)
  {
    memcpy(__dst, v4, sizeof(__dst));
    objc_msgSend(v6, "setReport:", __dst);
    v7 = v6;
  }
  else
  {
    v8 = v5;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446722;
      v12 = "-[NWActivityClientMetricStatistics initWithNWActivityClientMetricReport:length:]";
      v13 = 2048;
      v14 = 5272;
      v15 = 2048;
      v16 = v8;
      _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_ERROR, "%{public}s Failed to initialize statistics object from nw_activity client metrics report, expected size %zd actual size %zd", (uint8_t *)&v11, 0x20u);
    }

    v7 = 0;
  }

  return v7;
}

- (NWActivityClientMetricStatistics)initWithData:(id)a3
{
  id v4;
  NWActivityClientMetricStatistics *v5;
  NSDictionary *v6;
  NSObject *v7;
  NSObject *p_super;
  void *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  char *backtrace_string;
  os_log_type_t v14;
  _BOOL4 v15;
  os_log_type_t v16;
  NWActivityClientMetricStatistics *v17;
  id v19;
  char v20;
  os_log_type_t type;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NWActivityClientMetricStatistics;
  v5 = -[NWActivityClientMetricStatistics init](&v22, sel_init);
  if (v5)
  {
    if (v4 && objc_msgSend(v4, "length"))
    {
      v19 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v19);
      v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v7 = v19;
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v6 = v6;
        p_super = &v5->_dictionaryRepresentation->super;
        v5->_dictionaryRepresentation = v6;
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        p_super = (id)gLogObj;
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v24 = "-[NWActivityClientMetricStatistics initWithData:]";
          v25 = 2112;
          v26 = v7;
          _os_log_impl(&dword_182FBE000, p_super, OS_LOG_TYPE_ERROR, "%{public}s Failed to decode client metric data, skipping (error %@)", buf, 0x16u);
        }
      }

    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityClientMetricStatistics initWithData:]";
        _os_log_impl(&dword_182FBE000, v7, OS_LOG_TYPE_ERROR, "%{public}s Client metric data not present, skipping", buf, 0xCu);
      }
    }

    v17 = v5;
    goto LABEL_31;
  }
  __nwlog_obj();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v24 = "-[NWActivityClientMetricStatistics initWithData:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v20 = 0;
  if (__nwlog_fault(v10, &type, &v20))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityClientMetricStatistics initWithData:]";
        _os_log_impl(&dword_182FBE000, v11, v12, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v20)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      v15 = os_log_type_enabled(v11, type);
      if (backtrace_string)
      {
        if (v15)
        {
          *(_DWORD *)buf = 136446466;
          v24 = "-[NWActivityClientMetricStatistics initWithData:]";
          v25 = 2082;
          v26 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v11, v14, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_25;
      }
      if (v15)
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityClientMetricStatistics initWithData:]";
        _os_log_impl(&dword_182FBE000, v11, v14, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v16 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityClientMetricStatistics initWithData:]";
        _os_log_impl(&dword_182FBE000, v11, v16, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_25:
  if (v10)
    free(v10);
LABEL_31:

  return v5;
}

- (void)setActivityUUID:(id)a3
{
  objc_storeStrong((id *)&self->_activityUUID, a3);
}

- (NSUUID)externallyVisibleActivityUUID
{
  return self->_externallyVisibleActivityUUID;
}

- (void)setExternallyVisibleActivityUUID:(id)a3
{
  objc_storeStrong((id *)&self->_externallyVisibleActivityUUID, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void)setDictionaryRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, a3);
}

- (void)setMetricData:(id)a3
{
  objc_storeStrong((id *)&self->_metricData, a3);
}

- (nw_activity_client_metric_report_s)report
{
  return (nw_activity_client_metric_report_s *)memcpy(retstr, &self->_report, sizeof(nw_activity_client_metric_report_s));
}

- (void)setReport:(nw_activity_client_metric_report_s *)a3
{
  memcpy(&self->_report, a3, sizeof(self->_report));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricData, 0);
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_externallyVisibleActivityUUID, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
}

@end
