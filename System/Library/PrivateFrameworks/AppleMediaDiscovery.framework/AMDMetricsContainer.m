@implementation AMDMetricsContainer

- (AMDMetricsContainer)initWithLevel:(char)a3 andAction:(id)a4 andVersion:(id)a5 andBuild:(id)a6 andStorefrontId:(id)a7 withLoggingProbability:(id)a8
{
  AMDMetricsContainer *v8;
  double v9;
  AMDMetricsContainer *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  AMSMetricsEvent *v16;
  id v17;
  AMSMetricsEvent *v18;
  const __CFString *v19;
  NSMutableDictionary *v20;
  AMSMetricsEvent *v21;
  AMSMetricsEvent *v22;
  id v23;
  AMSMetricsEvent *v24;
  const __CFString *v25;
  id v26;
  AMSMetricsEvent *v27;
  void *v28;
  id v29;
  id v30;
  AMSMetricsEvent *v31;
  AMSMetricsEvent *v32;
  const __CFString *v33;
  NSMutableDictionary *v34;
  const __CFString *v35;
  id v40;
  NSMutableDictionary *v41;
  objc_super v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id location;
  char v48;
  SEL v49;
  AMDMetricsContainer *v50;

  v50 = self;
  v49 = a2;
  v48 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v46 = 0;
  objc_storeStrong(&v46, a5);
  v45 = 0;
  objc_storeStrong(&v45, a6);
  v44 = 0;
  objc_storeStrong(&v44, a7);
  v43 = 0;
  objc_storeStrong(&v43, a8);
  v8 = v50;
  v50 = 0;
  v42.receiver = v8;
  v42.super_class = (Class)AMDMetricsContainer;
  v50 = -[AMDMetricsContainer init](&v42, sel_init);
  objc_storeStrong((id *)&v50, v50);
  v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMDMetricsContainer setLogData:](v50, "setLogData:");

  v41 = -[AMDMetricsContainer logData](v50, "logData");
  if (location)
    v35 = (const __CFString *)location;
  else
    v35 = CFSTR("unknown");
  -[NSMutableDictionary setObject:forKey:](v41, "setObject:forKey:", v35, CFSTR("eventType"));

  v34 = -[AMDMetricsContainer logData](v50, "logData");
  if (v45)
    v33 = (const __CFString *)v45;
  else
    v33 = CFSTR("unknown");
  -[NSMutableDictionary setObject:forKey:](v34, "setObject:forKey:", v33, CFSTR("osBuildNumber"));

  v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB68]), "initWithTopic:", CFSTR("xp_amp_odp_log"));
  -[AMDMetricsContainer setMetricEvent:](v50, "setMetricEvent:");

  v27 = -[AMDMetricsContainer metricEvent](v50, "metricEvent");
  -[AMSMetricsEvent setAnonymous:](v27, "setAnonymous:", 1);

  v31 = -[AMDMetricsContainer metricEvent](v50, "metricEvent");
  v28 = (void *)MEMORY[0x1E0CB37E8];
  v30 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(v30, "timeIntervalSince1970");
  v29 = (id)objc_msgSend(v28, "numberWithDouble:", v9 * 1000.0);
  -[AMSMetricsEvent setProperty:forBodyKey:](v31, "setProperty:forBodyKey:");

  v32 = -[AMDMetricsContainer metricEvent](v50, "metricEvent");
  if (location)
    v25 = (const __CFString *)location;
  else
    v25 = CFSTR("unknown");
  -[AMSMetricsEvent setProperty:forBodyKey:](v32, "setProperty:forBodyKey:", v25, CFSTR("eventType"));

  v24 = -[AMDMetricsContainer metricEvent](v50, "metricEvent");
  if (v46)
    v23 = v46;
  else
    v23 = &unk_1EA4CEF50;
  -[AMSMetricsEvent setProperty:forBodyKey:](v24, "setProperty:forBodyKey:", v23, CFSTR("eventVersion"));

  v21 = -[AMDMetricsContainer metricEvent](v50, "metricEvent");
  v20 = -[AMDMetricsContainer logData](v50, "logData");
  -[AMSMetricsEvent setProperty:forBodyKey:](v21, "setProperty:forBodyKey:");

  v22 = -[AMDMetricsContainer metricEvent](v50, "metricEvent");
  if (v45)
    v19 = (const __CFString *)v45;
  else
    v19 = CFSTR("unknown");
  -[AMSMetricsEvent setProperty:forBodyKey:](v22, "setProperty:forBodyKey:", v19, CFSTR("osBuildNumber"));

  v18 = -[AMDMetricsContainer metricEvent](v50, "metricEvent");
  if (v44)
    v17 = v44;
  else
    v17 = &unk_1EA4CEF68;
  -[AMSMetricsEvent setProperty:forBodyKey:](v18, "setProperty:forBodyKey:", v17, CFSTR("storeFrontHeader"));

  v16 = -[AMDMetricsContainer metricEvent](v50, "metricEvent");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v15 = (id)objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v14 = (id)objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v15, "secondsFromGMT") / 3600);
  -[AMSMetricsEvent setProperty:forBodyKey:](v16, "setProperty:forBodyKey:");

  -[AMDMetricsContainer setVerbosity:](v50, "setVerbosity:", v48);
  if (v43)
    v12 = v43;
  else
    v12 = &unk_1EA4D1E28;
  -[AMDMetricsContainer setLoggingProbability:](v50, "setLoggingProbability:", v12);
  v11 = v50;
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v50, 0);
  return v11;
}

- (AMSMetricsEvent)metricEvent
{
  return self->_metricEvent;
}

- (void)setMetricEvent:(id)a3
{
  objc_storeStrong((id *)&self->_metricEvent, a3);
}

- (NSMutableDictionary)logData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (char)verbosity
{
  return self->_verbosity;
}

- (void)setVerbosity:(char)a3
{
  self->_verbosity = a3;
}

- (NSNumber)loggingProbability
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLoggingProbability:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingProbability, 0);
  objc_storeStrong((id *)&self->_logData, 0);
  objc_storeStrong((id *)&self->_metricEvent, 0);
}

@end
