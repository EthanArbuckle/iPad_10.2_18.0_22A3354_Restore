@implementation NTKJetsamInfoInterval

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (NTKJetsamInfoInterval)initWithLabel:(id)a3
{
  id v5;
  NTKJetsamInfoInterval *v6;
  NTKJetsamInfoInterval *v7;
  uint64_t v8;
  NTKJetsamInfoFetcher *fetcher;
  NSObject *v10;
  NSString *label;
  double v12;
  objc_super v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKJetsamInfoInterval;
  v6 = -[NTKJetsamInfoInterval init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_label, a3);
    v8 = objc_opt_new();
    fetcher = v7->_fetcher;
    v7->_fetcher = (NTKJetsamInfoFetcher *)v8;

    if (-[NTKJetsamInfoFetcher getInfo:](v7->_fetcher, "getInfo:", &v7->_startInfo))
    {
      if (-[NTKJetsamInfoFetcher resetInterval](v7->_fetcher, "resetInterval"))
      {
        _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          label = v7->_label;
          v12 = (double)v7->_startInfo.currentKB * 0.0009765625;
          *(_DWORD *)buf = 138412546;
          v16 = label;
          v17 = 2048;
          v18 = v12;
          _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "jetsam interval '%@': start footprint: %.3f", buf, 0x16u);
        }

      }
    }
  }

  return v7;
}

- (jetsam_info)currentInfo
{
  retstr->maxLifetimeKB = -1;
  retstr->maxIntervalKB = -1;
  retstr->currentKB = -1;
  return (jetsam_info *)-[NTKJetsamInfoFetcher getInfo:](self->_fetcher, "getInfo:");
}

- (void)logCurrentInterval
{
  NSObject *v3;
  NSString *label;
  double v5;
  _QWORD v6[2];
  uint64_t v7;
  uint8_t buf[4];
  NSString *v9;
  __int16 v10;
  double v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  v7 = 0;
  if (-[NTKJetsamInfoFetcher getInfo:](self->_fetcher, "getInfo:", v6))
  {
    _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      v5 = (double)self->_startInfo.currentKB * 0.0009765625;
      *(_DWORD *)buf = 138413058;
      v9 = label;
      v10 = 2048;
      v11 = v5;
      v12 = 2048;
      v13 = (double)v7 * 0.0009765625;
      v14 = 2048;
      v15 = (double)v6[0] * 0.0009765625;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "jetsam interval '%@': start footprint: %.3f, max: %.3f, end: %.3f", buf, 0x2Au);
    }

  }
}

- (void)reset
{
  -[NTKJetsamInfoFetcher getInfo:](self->_fetcher, "getInfo:", &self->_startInfo);
  -[NTKJetsamInfoFetcher resetInterval](self->_fetcher, "resetInterval");
}

- (BOOL)waitUntilDirtyMemoryReaches:(int64_t)a3 maxWaitMS:(int)a4
{
  int64_t v7;
  uint64_t v9;
  NSObject *v11;
  NSString *label;
  int64_t v14;
  int64_t v15;
  _BYTE __rqtp[22];
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NTKJetsamInfoInterval currentInfo](self, "currentInfo");
  v7 = v15;
  if (v15 > a3 && a4 >= 1)
  {
    v9 = 0;
    do
    {
      *(_OWORD *)__rqtp = xmmword_1B755F9A0;
      nanosleep((const timespec *)__rqtp, 0);
      v9 += 100;
      -[NTKJetsamInfoInterval currentInfo](self, "currentInfo");
      v7 = v14;
    }
    while (v14 > a3 && (int)v9 < a4);
    _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      *(_DWORD *)__rqtp = 138413058;
      *(_QWORD *)&__rqtp[4] = label;
      *(_WORD *)&__rqtp[12] = 2048;
      *(_QWORD *)&__rqtp[14] = v9;
      v17 = 2048;
      v18 = (float)((float)a3 * 0.00097656);
      v19 = 2048;
      v20 = (float)((float)v14 * 0.00097656);
      _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "jetsam interval '%@': waited %ld ms for footprint to get below %.3fMB, current = %.3fMB", __rqtp, 0x2Au);
    }

  }
  return v7 <= a3;
}

- (BOOL)waitUntilDirtyMemoryDrained
{
  return -[NTKJetsamInfoInterval waitUntilDirtyMemoryReaches:maxWaitMS:](self, "waitUntilDirtyMemoryReaches:maxWaitMS:", self->_startInfo.currentKB + 2048, 1000);
}

- (NSString)label
{
  return self->_label;
}

- (jetsam_info)startInfo
{
  *retstr = self[1];
  return self;
}

@end
