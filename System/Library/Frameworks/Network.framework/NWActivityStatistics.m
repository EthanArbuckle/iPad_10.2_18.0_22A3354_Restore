@implementation NWActivityStatistics

- (unsigned)domain
{
  unsigned int v3;

  -[NWActivityStatistics report](self, "report");
  return v3;
}

- (unsigned)label
{
  unsigned int v3;

  -[NWActivityStatistics report](self, "report");
  return v3;
}

- (BOOL)retry
{
  char v3;

  -[NWActivityStatistics report](self, "report");
  return v3 & 1;
}

- (NSUUID)activityUUID
{
  id v3;
  NSUUID *v4;
  NSUUID *activityUUID;
  uint64_t v7;
  unsigned __int8 v8[296];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_activityUUID)
  {
    -[NWActivityStatistics report](self, "report");
    if (!uuid_is_null(v8))
    {
      v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[NWActivityStatistics report](self, "report");
      v4 = (NSUUID *)objc_msgSend(v3, "initWithUUIDBytes:", &v7);
      activityUUID = self->_activityUUID;
      self->_activityUUID = v4;

    }
  }
  return self->_activityUUID;
}

- (NSUUID)parentUUID
{
  id v3;
  NSUUID *v4;
  NSUUID *parentUUID;
  uint64_t v7;
  unsigned __int8 v8[280];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_parentUUID)
  {
    -[NWActivityStatistics report](self, "report");
    if (!uuid_is_null(v8))
    {
      v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[NWActivityStatistics report](self, "report");
      v4 = (NSUUID *)objc_msgSend(v3, "initWithUUIDBytes:", &v7);
      parentUUID = self->_parentUUID;
      self->_parentUUID = v4;

    }
  }
  return self->_parentUUID;
}

- (unint64_t)investigation_identifier
{
  unint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NWActivityStatistics report](self, "report");
  return v3;
}

- (NSString)bundleID
{
  void *v2;
  _QWORD v4[34];

  v4[33] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[NWActivityStatistics report](self, "report");
  objc_msgSend(v2, "stringWithCString:encoding:", v4, 134217984);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  char v6[264];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  NWActivityStatistics *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogDatapath)
  {
    __nwlog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v8 = "-[NWActivityStatistics setBundleID:]";
      v9 = 2112;
      v10 = v4;
      v11 = 2112;
      v12 = self;
      _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEBUG, "%{public}s Set bundle ID to %@ for %@", buf, 0x20u);
    }

  }
  -[NWActivityStatistics report](self, "report");
  strlcpy(v6, (const char *)objc_msgSend(v4, "UTF8String"), 0x100uLL);

}

- (unsigned)metricType
{
  if (self->_metricType)
    return self->_metricType;
  else
    return 3;
}

- (NSMutableDictionary)dictionaryReport
{
  NSMutableDictionary *dictionaryReport;
  NSMutableDictionary **p_dictionaryReport;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSMutableDictionary *v16;
  int v18;
  const char *v19;
  __int16 v20;
  NSMutableDictionary *v21;
  char v22[312];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_dictionaryReport = &self->_dictionaryReport;
  dictionaryReport = self->_dictionaryReport;
  if (!dictionaryReport)
  {
    -[NWActivityStatistics externallyVisibleActivityUUID](self, "externallyVisibleActivityUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NWActivityStatistics externallyVisibleActivityUUID](self, "externallyVisibleActivityUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[NWActivityStatistics externallyVisibleParentUUID](self, "externallyVisibleParentUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NWActivityStatistics externallyVisibleParentUUID](self, "externallyVisibleParentUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[NWActivityStatistics report](self, "report");
    +[NWActivityStatistics createActivityReportDictionary:uuidString:parentUUIDString:](NWActivityStatistics, "createActivityReportDictionary:uuidString:parentUUIDString:", v22, v5, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {

      return (NSMutableDictionary *)0;
    }
    v10 = (void *)v9;
    -[NWActivityStatistics layer2Report](self, "layer2Report");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[NWActivityStatistics layer2Report](self, "layer2Report");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("l2Report"));

    }
    -[NWActivityStatistics deviceReport](self, "deviceReport");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NWActivityStatistics deviceReport](self, "deviceReport");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("deviceReport"));

    }
    -[NWActivityStatistics setMetricType:](self, "setMetricType:", 3);
    objc_storeStrong((id *)p_dictionaryReport, v10);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = *p_dictionaryReport;
      v18 = 136446466;
      v19 = "-[NWActivityStatistics dictionaryReport]";
      v20 = 2114;
      v21 = v16;
      _os_log_impl(&dword_182FBE000, v15, OS_LOG_TYPE_DEBUG, "%{public}s Generated nw_activity report: %{public}@", (uint8_t *)&v18, 0x16u);
    }

    dictionaryReport = *p_dictionaryReport;
  }
  return dictionaryReport;
}

- (NWActivityStatistics)initWithNWActivityReport:(nw_activity_report_s *)a3 length:(unint64_t)a4
{
  NWActivityStatistics *v5;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  _BYTE __dst[312];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a4 == 312)
  {
    memcpy(__dst, a3, sizeof(__dst));
    -[NWActivityStatistics setReport:](self, "setReport:", __dst);
    v5 = self;
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446722;
      v10 = "-[NWActivityStatistics initWithNWActivityReport:length:]";
      v11 = 2048;
      v12 = 312;
      v13 = 2048;
      v14 = a4;
      _os_log_impl(&dword_182FBE000, v7, OS_LOG_TYPE_ERROR, "%{public}s failure to initialize statistics object from nw_activity report, expected size %zd actual size %zd", (uint8_t *)&v9, 0x20u);
    }

    v5 = 0;
  }

  return v5;
}

- (NWActivityStatistics)initWithJSONData:(id)a3
{
  id v4;
  NWActivityStatistics *v5;
  uint64_t v6;
  id v7;
  NSMutableDictionary *dictionaryReport;
  NWActivityStatistics *v9;
  void *v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  char *backtrace_string;
  os_log_type_t v16;
  _BOOL4 v17;
  os_log_type_t v18;
  id v19;
  char v20;
  os_log_type_t type;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NWActivityStatistics;
  v5 = -[NWActivityStatistics init](&v22, sel_init);
  if (v5)
  {
    if (v4 && objc_msgSend(v4, "length"))
    {
      v19 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 1, &v19);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v19;
      dictionaryReport = v5->_dictionaryReport;
      v5->_dictionaryReport = (NSMutableDictionary *)v6;

    }
    v9 = v5;
    goto LABEL_6;
  }
  __nwlog_obj();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v24 = "-[NWActivityStatistics initWithJSONData:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v20 = 0;
  if (__nwlog_fault(v12, &type, &v20))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityStatistics initWithJSONData:]";
        _os_log_impl(&dword_182FBE000, v13, v14, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v20)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v16 = type;
      v17 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v17)
        {
          *(_DWORD *)buf = 136446466;
          v24 = "-[NWActivityStatistics initWithJSONData:]";
          v25 = 2082;
          v26 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v13, v16, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_23;
      }
      if (v17)
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityStatistics initWithJSONData:]";
        _os_log_impl(&dword_182FBE000, v13, v16, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v18 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWActivityStatistics initWithJSONData:]";
        _os_log_impl(&dword_182FBE000, v13, v18, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_23:
  if (v12)
    free(v12);
LABEL_6:

  return v5;
}

- (NSUUID)externallyVisibleActivityUUID
{
  return self->_externallyVisibleActivityUUID;
}

- (void)setExternallyVisibleActivityUUID:(id)a3
{
  objc_storeStrong((id *)&self->_externallyVisibleActivityUUID, a3);
}

- (NSUUID)externallyVisibleParentUUID
{
  return self->_externallyVisibleParentUUID;
}

- (void)setExternallyVisibleParentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_externallyVisibleParentUUID, a3);
}

- (void)setActivityUUID:(id)a3
{
  objc_storeStrong((id *)&self->_activityUUID, a3);
}

- (void)setParentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_parentUUID, a3);
}

- (NSDictionary)layer2Report
{
  return self->_layer2Report;
}

- (void)setLayer2Report:(id)a3
{
  objc_storeStrong((id *)&self->_layer2Report, a3);
}

- (NSDictionary)deviceReport
{
  return self->_deviceReport;
}

- (void)setDeviceReport:(id)a3
{
  objc_storeStrong((id *)&self->_deviceReport, a3);
}

- (void)setMetricType:(unsigned __int8)a3
{
  self->_metricType = a3;
}

- (void)setDictionaryReport:(id)a3
{
  objc_storeStrong((id *)&self->_dictionaryReport, a3);
}

- (nw_activity_report_s)report
{
  return (nw_activity_report_s *)memcpy(retstr, &self->_report, sizeof(nw_activity_report_s));
}

- (void)setReport:(nw_activity_report_s *)a3
{
  memcpy(&self->_report, a3, sizeof(self->_report));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryReport, 0);
  objc_storeStrong((id *)&self->_deviceReport, 0);
  objc_storeStrong((id *)&self->_layer2Report, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_externallyVisibleParentUUID, 0);
  objc_storeStrong((id *)&self->_externallyVisibleActivityUUID, 0);
}

+ (id)createActivityReportDictionary:(nw_activity_report_s *)a3 uuidString:(id)a4 parentUUIDString:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->domain);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("activityDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->label);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("activityLabel"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((_BYTE *)a3 + 304) & 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("isRetry"));

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("activityUUID"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("parentActivityUUID"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", a3->bundle_id, 134217984);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("bundleID"));

    if (os_variant_has_internal_diagnostics())
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3->investigation_identifier);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("investigationID"));

    }
    v15 = v9;
  }

  return v9;
}

@end
