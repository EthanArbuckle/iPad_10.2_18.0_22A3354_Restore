@implementation CVNLPPerformanceResult

- (CVNLPPerformanceResult)initWithName:(id)a3
{
  id v5;
  CVNLPPerformanceResult *v6;
  CVNLPPerformanceResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CVNLPPerformanceResult;
  v6 = -[CVNLPPerformanceResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("[%@: Peak-Delta: %lf, CPU-Time: %lf, Interval: %lf]"), v8, v6, *(_QWORD *)&self->peakdelta, *(_QWORD *)&self->cpuTime, *(_QWORD *)&self->timeInterval);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dict
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("maxpeak");
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, self->maxpeak);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  v25[1] = CFSTR("peakdelta");
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v6, v7, v8, self->peakdelta);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v9;
  v25[2] = CFSTR("recentpeak");
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v10, v11, v12, self->recentpeak);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v13;
  v25[3] = CFSTR("current");
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v14, v15, v16, self->current);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v17;
  v25[4] = CFSTR("timeInterval");
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v18, v19, v20, self->timeInterval);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v21;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v26, (uint64_t)v25, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
