@implementation NWConnectionStatistics

- (BOOL)delegated
{
  BOOL v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)timeToDnsResolvedMsecs
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)timeToDnsStartMsecs
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)dnsResolvedTimeMsecs
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (BOOL)dnsAnswersCached
{
  char v3;

  -[NWConnectionStatistics report](self, "report");
  return v3 & 1;
}

- (int)interfaceType
{
  int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)timeToConnectionStartMsecs
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)timeToConnectionEstablishmentMsecs
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)connectionEstablishmentTimeMsecs
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)flowDurationMsecs
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (int)connectedInterfaceType
{
  int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (BOOL)connected
{
  unsigned __int16 v4;

  -[NWConnectionStatistics report](self, "report");
  return (v4 >> 1) & 1;
}

- (unint64_t)bytesIn
{
  unint64_t v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unint64_t)bytesOut
{
  unint64_t v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unint64_t)bytesDuplicate
{
  unint64_t v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unint64_t)bytesOOO
{
  unint64_t v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unint64_t)bytesRetransmitted
{
  unint64_t v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unint64_t)packetsIn
{
  unint64_t v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unint64_t)packetsOut
{
  unint64_t v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unint64_t)packetsDuplicate
{
  unint64_t v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unint64_t)packetsOOO
{
  unint64_t v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unint64_t)packetsRetransmitted
{
  unint64_t v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)tcpRTTCurrentMsecs
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)tcpRTTSmoothedMsecs
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)tcpRTTBestMsecs
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)tcpRTTVariance
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)tcpSynRetransmissionCount
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (BOOL)tcpFastOpen
{
  unsigned __int16 v4;

  -[NWConnectionStatistics report](self, "report");
  return (v4 >> 9) & 1;
}

- (unsigned)tcpBetterRouteEventCount
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)tcpConnectionReuseCount
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)tcpAppReportingDataStallCount
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)tcpAppDataStallTimerMsecs
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)trafficClass
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (BOOL)fallbackEligible
{
  int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3 == 1;
}

- (BOOL)cellularFallback
{
  unsigned __int16 v4;

  -[NWConnectionStatistics report](self, "report");
  return (v4 >> 2) & 1;
}

- (BOOL)cellularRrcConnected
{
  unsigned __int16 v4;

  -[NWConnectionStatistics report](self, "report");
  return (v4 >> 3) & 1;
}

- (BOOL)tls13Configured
{
  int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3 == 5;
}

- (BOOL)tlsSucceeded
{
  unsigned int v4;

  -[NWConnectionStatistics report](self, "report");
  return ((unint64_t)v4 >> 15) & 1;
}

- (BOOL)kernelReportedStalls
{
  unsigned __int16 v4;

  -[NWConnectionStatistics report](self, "report");
  return (v4 >> 5) & 1;
}

- (BOOL)kernelReportingConnectionStalled
{
  unsigned __int16 v4;

  -[NWConnectionStatistics report](self, "report");
  return (v4 >> 6) & 1;
}

- (BOOL)kernelReportingReadStalled
{
  unsigned __int16 v4;

  -[NWConnectionStatistics report](self, "report");
  return (v4 >> 7) & 1;
}

- (BOOL)kernelReportingWriteStalled
{
  unsigned __int16 v4;

  -[NWConnectionStatistics report](self, "report");
  return HIBYTE(v4) & 1;
}

- (NSUUID)connectionUUID
{
  id v3;
  char v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[NWConnectionStatistics report](self, "report");
  return (NSUUID *)(id)objc_msgSend(v3, "initWithUUIDBytes:", &v5);
}

- (NSUUID)parentUUID
{
  id v3;
  char v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[NWConnectionStatistics report](self, "report");
  return (NSUUID *)(id)objc_msgSend(v3, "initWithUUIDBytes:", &v5);
}

- (BOOL)tlsHandshakeTimedOut
{
  unsigned int v4;

  -[NWConnectionStatistics report](self, "report");
  return ((unint64_t)v4 >> 24) & 1;
}

- (NSArray)activities
{
  id *v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  char *backtrace_string;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  os_log_type_t v20;
  NSObject *v21;
  char *v22;
  int *p_buf;
  uint64_t v25;
  id *location;
  id v27;
  char v28;
  os_log_type_t type[6849];
  int buf;
  const char *v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v2 = (id *)MEMORY[0x1E0C80A78](self);
  v34 = *MEMORY[0x1E0C80C00];
  v3 = v2[6];
  if (v3)
    return (NSArray *)v3;
  location = v2 + 6;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = 0;
  v6 = 383;
  v27 = v4;
  while (1)
  {
    objc_msgSend(v2, "report", p_buf, v25);
    if (uuid_is_null((const unsigned __int8 *)&type[v6 + 3425]) || v5 >= 0x32)
      break;
    v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v2, "report");
    v8 = (void *)objc_msgSend(v7, "initWithUUIDBytes:", &type[v6 + 1]);
    if (v8)
    {
      objc_msgSend(v4, "addObject:", v8);
      goto LABEL_4;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    buf = 136446210;
    v31 = "-[NWConnectionStatistics activities]";
    LODWORD(v25) = 12;
    p_buf = &buf;
    v10 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v28 = 0;
    if (__nwlog_fault(v10, type, &v28))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v12 = type[0];
        if (os_log_type_enabled(v11, type[0]))
        {
          buf = 136446210;
          v31 = "-[NWConnectionStatistics activities]";
          v13 = v11;
          v14 = v12;
          v15 = "%{public}s Failed to convert UUID from connection report";
          goto LABEL_19;
        }
      }
      else
      {
        if (v28)
        {
          backtrace_string = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v17 = (id)gLogObj;
          v18 = type[0];
          v19 = os_log_type_enabled(v17, type[0]);
          if (backtrace_string)
          {
            if (v19)
            {
              buf = 136446466;
              v31 = "-[NWConnectionStatistics activities]";
              v32 = 2082;
              v33 = backtrace_string;
              _os_log_impl(&dword_182FBE000, v17, v18, "%{public}s Failed to convert UUID from connection report, dumping backtrace:%{public}s", (uint8_t *)&buf, 0x16u);
            }

            free(backtrace_string);
          }
          else
          {
            if (v19)
            {
              buf = 136446210;
              v31 = "-[NWConnectionStatistics activities]";
              _os_log_impl(&dword_182FBE000, v17, v18, "%{public}s Failed to convert UUID from connection report, no backtrace", (uint8_t *)&buf, 0xCu);
            }

          }
          v4 = v27;
          goto LABEL_25;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v20 = type[0];
        if (os_log_type_enabled(v11, type[0]))
        {
          buf = 136446210;
          v31 = "-[NWConnectionStatistics activities]";
          v13 = v11;
          v14 = v20;
          v15 = "%{public}s Failed to convert UUID from connection report, backtrace limit exceeded";
LABEL_19:
          _os_log_impl(&dword_182FBE000, v13, v14, v15, (uint8_t *)&buf, 0xCu);
        }
      }

    }
LABEL_25:
    if (v10)
      free(v10);
LABEL_4:

    ++v5;
    v6 += 16;
  }
  objc_storeStrong(location, v4);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v21 = (id)gLogObj;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = (char *)*location;
    buf = 136446466;
    v31 = "-[NWConnectionStatistics activities]";
    v32 = 2112;
    v33 = v22;
    _os_log_impl(&dword_182FBE000, v21, OS_LOG_TYPE_DEBUG, "%{public}s Created array of UUIDs: %@", (uint8_t *)&buf, 0x16u);
  }

  v3 = *location;
  return (NSArray *)v3;
}

- (NSString)bundleID
{
  id v3;
  char v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NWConnectionStatistics report](self, "report");
  return (NSString *)(id)objc_msgSend(v3, "initWithCString:encoding:", &v5, 134217984);
}

- (void)setBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  char v6[2241];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  NWConnectionStatistics *v12;
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
      v8 = "-[NWConnectionStatistics setBundleID:]";
      v9 = 2112;
      v10 = v4;
      v11 = 2112;
      v12 = self;
      _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEBUG, "%{public}s Set bundle ID to %@ for %@", buf, 0x20u);
    }

  }
  -[NWConnectionStatistics report](self, "report");
  strlcpy(v6, (const char *)objc_msgSend(v4, "UTF8String"), 0x100uLL);

}

- (NSString)effectiveBundleID
{
  id v3;
  char v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NWConnectionStatistics report](self, "report");
  return (NSString *)(id)objc_msgSend(v3, "initWithCString:encoding:", &v5, 134217984);
}

- (void)setEffectiveBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  char v6[1985];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  NWConnectionStatistics *v12;
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
      v8 = "-[NWConnectionStatistics setEffectiveBundleID:]";
      v9 = 2112;
      v10 = v4;
      v11 = 2112;
      v12 = self;
      _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEBUG, "%{public}s Set effective bundle ID to %@ for %@", buf, 0x20u);
    }

  }
  -[NWConnectionStatistics report](self, "report");
  strlcpy(v6, (const char *)objc_msgSend(v4, "UTF8String"), 0x100uLL);

}

- (unsigned)connectionReportReason
{
  unsigned int v3;

  -[NWConnectionStatistics report](self, "report");
  return v3;
}

- (unsigned)metricType
{
  if (self->_metricType <= 1u)
    return 1;
  else
    return self->_metricType;
}

- (id)_createDataUsageSnapshotDictionaryFromStruct:(const netcore_stats_data_usage_snapshot *)a3
{
  id v4;
  void *v5;
  unint64_t bytes_in;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t bytes_out;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t multipath_bytes_in_cell;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unint64_t multipath_bytes_out_cell;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  void *v32;
  void *v33;
  unint64_t multipath_bytes_in_wifi;
  double v35;
  double v36;
  double v37;
  unint64_t v38;
  void *v39;
  void *v40;
  unint64_t multipath_bytes_out_wifi;
  double v42;
  double v43;
  double v44;
  unint64_t v45;
  void *v46;
  void *v47;
  unint64_t multipath_bytes_in_initial;
  double v49;
  double v50;
  double v51;
  unint64_t v52;
  void *v53;
  void *v54;
  unint64_t multipath_bytes_out_initial;
  double v56;
  double v57;
  double v58;
  unint64_t v59;
  void *v60;
  id v61;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    bytes_in = a3->bytes_in;
    if (a3->bytes_in)
    {
      v7 = (double)bytes_in;
      v8 = log10((double)bytes_in);
      v9 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v8)));
      v10 = (unint64_t)(trunc(round(v9 * v7)) / v9);
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v5, "numberWithUnsignedLongLong:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("bytesIn"));

    v12 = (void *)MEMORY[0x1E0CB37E8];
    bytes_out = a3->bytes_out;
    if (bytes_out)
    {
      v14 = (double)bytes_out;
      v15 = log10((double)bytes_out);
      v16 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v15)));
      v17 = (unint64_t)(trunc(round(v16 * v14)) / v16);
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v12, "numberWithUnsignedLongLong:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("bytesOut"));

    v19 = (void *)MEMORY[0x1E0CB37E8];
    multipath_bytes_in_cell = a3->multipath_bytes_in_cell;
    if (multipath_bytes_in_cell)
    {
      v21 = (double)multipath_bytes_in_cell;
      v22 = log10((double)multipath_bytes_in_cell);
      v23 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v22)));
      v24 = (unint64_t)(trunc(round(v23 * v21)) / v23);
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v19, "numberWithUnsignedLongLong:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("multipathBytesInCell"));

    v26 = (void *)MEMORY[0x1E0CB37E8];
    multipath_bytes_out_cell = a3->multipath_bytes_out_cell;
    if (multipath_bytes_out_cell)
    {
      v28 = (double)multipath_bytes_out_cell;
      v29 = log10((double)multipath_bytes_out_cell);
      v30 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v29)));
      v31 = (unint64_t)(trunc(round(v30 * v28)) / v30);
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v26, "numberWithUnsignedLongLong:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("multipathBytesOutCell"));

    v33 = (void *)MEMORY[0x1E0CB37E8];
    multipath_bytes_in_wifi = a3->multipath_bytes_in_wifi;
    if (multipath_bytes_in_wifi)
    {
      v35 = (double)multipath_bytes_in_wifi;
      v36 = log10((double)multipath_bytes_in_wifi);
      v37 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v36)));
      v38 = (unint64_t)(trunc(round(v37 * v35)) / v37);
    }
    else
    {
      v38 = 0;
    }
    objc_msgSend(v33, "numberWithUnsignedLongLong:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("multipathBytesInWiFi"));

    v40 = (void *)MEMORY[0x1E0CB37E8];
    multipath_bytes_out_wifi = a3->multipath_bytes_out_wifi;
    if (multipath_bytes_out_wifi)
    {
      v42 = (double)multipath_bytes_out_wifi;
      v43 = log10((double)multipath_bytes_out_wifi);
      v44 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v43)));
      v45 = (unint64_t)(trunc(round(v44 * v42)) / v44);
    }
    else
    {
      v45 = 0;
    }
    objc_msgSend(v40, "numberWithUnsignedLongLong:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v46, CFSTR("multipathBytesOutWiFi"));

    v47 = (void *)MEMORY[0x1E0CB37E8];
    multipath_bytes_in_initial = a3->multipath_bytes_in_initial;
    if (multipath_bytes_in_initial)
    {
      v49 = (double)multipath_bytes_in_initial;
      v50 = log10((double)multipath_bytes_in_initial);
      v51 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v50)));
      v52 = (unint64_t)(trunc(round(v51 * v49)) / v51);
    }
    else
    {
      v52 = 0;
    }
    objc_msgSend(v47, "numberWithUnsignedLongLong:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v53, CFSTR("multipathBytesInInitial"));

    v54 = (void *)MEMORY[0x1E0CB37E8];
    multipath_bytes_out_initial = a3->multipath_bytes_out_initial;
    if (multipath_bytes_out_initial)
    {
      v56 = (double)multipath_bytes_out_initial;
      v57 = log10((double)multipath_bytes_out_initial);
      v58 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v57)));
      v59 = (unint64_t)(trunc(round(v58 * v56)) / v58);
    }
    else
    {
      v59 = 0;
    }
    objc_msgSend(v54, "numberWithUnsignedLongLong:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v60, CFSTR("multipathBytesOutInitial"));

    v61 = v4;
  }

  return v4;
}

- (id)_createStatisticsReportDictionaryFromStruct:(const netcore_stats_tcp_statistics_report *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t bytes_in;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  void *v32;
  void *v33;
  unint64_t bytes_out;
  double v35;
  double v36;
  double v37;
  unint64_t v38;
  void *v39;
  void *v40;
  unint64_t bytes_duplicate;
  double v42;
  double v43;
  double v44;
  unint64_t v45;
  void *v46;
  void *v47;
  unint64_t bytes_ooo;
  double v49;
  double v50;
  double v51;
  unint64_t v52;
  void *v53;
  void *v54;
  unint64_t bytes_retransmitted;
  double v56;
  double v57;
  double v58;
  unint64_t v59;
  void *v60;
  void *v61;
  unint64_t packets_in;
  double v63;
  double v64;
  double v65;
  unint64_t v66;
  void *v67;
  void *v68;
  unint64_t packets_out;
  double v70;
  double v71;
  double v72;
  unint64_t v73;
  void *v74;
  void *v75;
  unint64_t packets_duplicate;
  double v77;
  double v78;
  double v79;
  unint64_t v80;
  void *v81;
  void *v82;
  unint64_t packets_ooo;
  double v84;
  double v85;
  double v86;
  unint64_t v87;
  void *v88;
  void *v89;
  unint64_t packets_retransmitted;
  double v91;
  double v92;
  double v93;
  unint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->time_to_dns_start_msecs);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("timeToDNSStartMsecs"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->time_to_dns_resolved_msecs);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("timeToDNSResolvedMsecs"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->dns_resolved_time_msecs);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("dNSResolvedTimeMsecs"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((_WORD *)a3 + 104) & 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("dNSAnswersCached"));

    v9 = a3->interface_type - 1;
    if (v9 > 3)
      v10 = CFSTR("INTERFACE_TYPE_OTHER");
    else
      v10 = off_1E14A9748[v9];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("interfaceType"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->time_to_connection_start_msecs);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("timeToConnectionStartMsecs"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->time_to_connection_establishment_msecs);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("timeToConnectionEstablishmentMsecs"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->connection_establishment_time_msecs);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("connectionEstablishmentTimeMsecs"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->flow_duration_msecs);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("flowDurationMsecs"));

    v15 = a3->connected_interface_type - 1;
    if (v15 > 3)
      v16 = CFSTR("INTERFACE_TYPE_OTHER");
    else
      v16 = off_1E14A9748[v15];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("connectedInterfaceType"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*((unsigned __int16 *)a3 + 104) >> 1) & 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("connected"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->traffic_class);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("trafficClass"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*((unsigned __int16 *)a3 + 104) >> 2) & 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("cellularFallback"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*((unsigned __int16 *)a3 + 104) >> 4) & 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("preferFallback"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*((unsigned __int16 *)a3 + 104) >> 3) & 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("cellularRRCConnected"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*((unsigned __int16 *)a3 + 104) >> 5) & 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("kernelReportedStalls"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*((unsigned __int16 *)a3 + 104) >> 6) & 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("kernelReportingConnectionStalled"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*((unsigned __int16 *)a3 + 104) >> 7) & 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("kernelReportingReadStalled"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIBYTE(*((unsigned __int16 *)a3 + 104)) & 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("kernelReportingWriteStalled"));

    v26 = (void *)MEMORY[0x1E0CB37E8];
    bytes_in = a3->bytes_in;
    if (a3->bytes_in)
    {
      v28 = (double)bytes_in;
      v29 = log10((double)bytes_in);
      v30 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v29)));
      v31 = (unint64_t)(trunc(round(v30 * v28)) / v30);
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v26, "numberWithUnsignedLongLong:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("bytesIn"));

    v33 = (void *)MEMORY[0x1E0CB37E8];
    bytes_out = a3->bytes_out;
    if (bytes_out)
    {
      v35 = (double)bytes_out;
      v36 = log10((double)bytes_out);
      v37 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v36)));
      v38 = (unint64_t)(trunc(round(v37 * v35)) / v37);
    }
    else
    {
      v38 = 0;
    }
    objc_msgSend(v33, "numberWithUnsignedLongLong:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("bytesOut"));

    v40 = (void *)MEMORY[0x1E0CB37E8];
    bytes_duplicate = a3->bytes_duplicate;
    if (bytes_duplicate)
    {
      v42 = (double)bytes_duplicate;
      v43 = log10((double)bytes_duplicate);
      v44 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v43)));
      v45 = (unint64_t)(trunc(round(v44 * v42)) / v44);
    }
    else
    {
      v45 = 0;
    }
    objc_msgSend(v40, "numberWithUnsignedLongLong:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v46, CFSTR("bytesDuplicate"));

    v47 = (void *)MEMORY[0x1E0CB37E8];
    bytes_ooo = a3->bytes_ooo;
    if (bytes_ooo)
    {
      v49 = (double)bytes_ooo;
      v50 = log10((double)bytes_ooo);
      v51 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v50)));
      v52 = (unint64_t)(trunc(round(v51 * v49)) / v51);
    }
    else
    {
      v52 = 0;
    }
    objc_msgSend(v47, "numberWithUnsignedLongLong:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v53, CFSTR("bytesOutOfOrder"));

    v54 = (void *)MEMORY[0x1E0CB37E8];
    bytes_retransmitted = a3->bytes_retransmitted;
    if (bytes_retransmitted)
    {
      v56 = (double)bytes_retransmitted;
      v57 = log10((double)bytes_retransmitted);
      v58 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v57)));
      v59 = (unint64_t)(trunc(round(v58 * v56)) / v58);
    }
    else
    {
      v59 = 0;
    }
    objc_msgSend(v54, "numberWithUnsignedLongLong:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v60, CFSTR("bytesRetransmitted"));

    v61 = (void *)MEMORY[0x1E0CB37E8];
    packets_in = a3->packets_in;
    if (packets_in)
    {
      v63 = (double)packets_in;
      v64 = log10((double)packets_in);
      v65 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v64)));
      v66 = (unint64_t)(trunc(round(v65 * v63)) / v65);
    }
    else
    {
      v66 = 0;
    }
    objc_msgSend(v61, "numberWithUnsignedLongLong:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v67, CFSTR("packetsIn"));

    v68 = (void *)MEMORY[0x1E0CB37E8];
    packets_out = a3->packets_out;
    if (packets_out)
    {
      v70 = (double)packets_out;
      v71 = log10((double)packets_out);
      v72 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v71)));
      v73 = (unint64_t)(trunc(round(v72 * v70)) / v72);
    }
    else
    {
      v73 = 0;
    }
    objc_msgSend(v68, "numberWithUnsignedLongLong:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v74, CFSTR("packetsOut"));

    v75 = (void *)MEMORY[0x1E0CB37E8];
    packets_duplicate = a3->packets_duplicate;
    if (packets_duplicate)
    {
      v77 = (double)packets_duplicate;
      v78 = log10((double)packets_duplicate);
      v79 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v78)));
      v80 = (unint64_t)(trunc(round(v79 * v77)) / v79);
    }
    else
    {
      v80 = 0;
    }
    objc_msgSend(v75, "numberWithUnsignedLongLong:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v81, CFSTR("packetsDuplicate"));

    v82 = (void *)MEMORY[0x1E0CB37E8];
    packets_ooo = a3->packets_ooo;
    if (packets_ooo)
    {
      v84 = (double)packets_ooo;
      v85 = log10((double)packets_ooo);
      v86 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v85)));
      v87 = (unint64_t)(trunc(round(v86 * v84)) / v86);
    }
    else
    {
      v87 = 0;
    }
    objc_msgSend(v82, "numberWithUnsignedLongLong:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v88, CFSTR("packetsOutOfOrder"));

    v89 = (void *)MEMORY[0x1E0CB37E8];
    packets_retransmitted = a3->packets_retransmitted;
    if (packets_retransmitted)
    {
      v91 = (double)packets_retransmitted;
      v92 = log10((double)packets_retransmitted);
      v93 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v92)));
      v94 = (unint64_t)(trunc(round(v93 * v91)) / v93);
    }
    else
    {
      v94 = 0;
    }
    objc_msgSend(v89, "numberWithUnsignedLongLong:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v95, CFSTR("packetsRetransmitted"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->current_rtt_msecs);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v96, CFSTR("currentRTTMsecs"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->smoothed_rtt_msecs);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v97, CFSTR("smoothedRTTMsecs"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->best_rtt_msecs);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v98, CFSTR("bestRTTMsecs"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->rtt_variance);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v99, CFSTR("rTTvariance"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->syn_retransmission_count);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v100, CFSTR("synRetransmissionCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*((unsigned __int16 *)a3 + 104) >> 9) & 1);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v101, CFSTR("tcpFastOpen"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->better_route_event_count);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v102, CFSTR("betterRouteEventCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->connection_reuse_count);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v103, CFSTR("connectionReuseCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->app_reporting_data_stall_count);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v104, CFSTR("appReportingDataStallCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->app_data_stall_timer_msecs);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v105, CFSTR("appDataStallTimerMsecs"));

    v106 = v4;
  }

  return v4;
}

- (id)_createFallbackReportDictionaryFromStruct:(const netcore_stats_tcp_cell_fallback_report *)a3
{
  id v5;
  void *v6;
  int deny_reason;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  unint64_t v12;
  unsigned int *p_time_to_network_event_msecs;
  unsigned int v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  unint64_t v19;
  netcore_stats_data_usage_snapshot *data_usage_snapshots_at_network_events;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NWConnectionStatistics *v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a3)
  {
    v25 = self;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->fellback);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("fellback"));

    deny_reason = a3->deny_reason;
    if (deny_reason)
    {
      v8 = CFSTR("DENY_REASON_BLOCKED_FROM_USING_CELL_DATA");
      if (deny_reason == 2)
        v8 = CFSTR("DENY_REASON_EXCEEDED_CELL_FALLBACK_DATA_BUDGET");
      if (deny_reason == 3)
        v9 = CFSTR("DENY_REASON_METRICS_TESTING_DENIED");
      else
        v9 = v8;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("denyReason"));
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->fallback_timer_msecs);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v5;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("fallbackTimerMsecs"));

    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a3->network_event_count)
    {
      v12 = 0;
      p_time_to_network_event_msecs = &a3->network_events[0].time_to_network_event_msecs;
      do
      {
        v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v17 = v16;
        objc_msgSend(v16, "setObject:forKeyedSubscript:");
        v14 = *p_time_to_network_event_msecs;
        p_time_to_network_event_msecs += 2;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("timeToNetworkEventsMsecs"));

        objc_msgSend(v11, "addObject:", v17);
        ++v12;
      }
      while (v12 < a3->network_event_count);
    }
    v5 = v26;
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v11, CFSTR("networkEvents"));
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a3->data_usage_snapshots_at_network_events_count)
    {
      v19 = 0;
      data_usage_snapshots_at_network_events = a3->data_usage_snapshots_at_network_events;
      while (1)
      {
        -[NWConnectionStatistics _createDataUsageSnapshotDictionaryFromStruct:](v25, "_createDataUsageSnapshotDictionaryFromStruct:", data_usage_snapshots_at_network_events);
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21)
          break;
        v22 = (void *)v21;
        objc_msgSend(v18, "addObject:", v21);

        ++v19;
        ++data_usage_snapshots_at_network_events;
        if (v19 >= a3->data_usage_snapshots_at_network_events_count)
          goto LABEL_17;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v23 = (id)gLogObj;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWConnectionStatistics _createFallbackReportDictionaryFromStruct:]";
        _os_log_impl(&dword_182FBE000, v23, OS_LOG_TYPE_ERROR, "%{public}s failing to allocate NWLibnetcoreConnectionDataUsageSnapshotDictionary", buf, 0xCu);
      }

      a3 = 0;
    }
    else
    {
LABEL_17:
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v18, CFSTR("connectionDataUsageSnapshots"));
      a3 = v26;
    }

  }
  return (id)(id)a3;
}

- (NSMutableDictionary)dictionaryReport
{
  uint64_t v2;
  id v3;
  id *v4;
  id v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  uint8_t *v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  id v63;
  unint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  id v69;
  NSObject *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  unsigned int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  const __CFString *v94;
  const __CFString *v95;
  __int16 v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  const __CFString *v119;
  const __CFString *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  const __CFString *v126;
  const __CFString *v127;
  const __CFString *v128;
  const __CFString *v129;
  void *v130;
  const __CFString *v131;
  const __CFString *v132;
  const __CFString *v133;
  const __CFString *v134;
  const __CFString *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  const __CFString *v159;
  const __CFString *v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t i;
  char *v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  NSObject *v171;
  void *v172;
  id v173;
  id v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t j;
  void *v188;
  NSObject *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  NSObject *v196;
  id v197;
  void *v198;
  id *v199;
  id v200;
  unsigned int v201;
  int v202;
  unsigned __int8 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  char v240;
  char v241;
  unsigned __int8 v242;
  int v243;
  int v244;
  char v245;
  unsigned __int8 v246;
  unsigned int v247;
  unsigned __int16 v248;
  _BYTE v249[512];
  _BYTE v250[64];
  _BYTE v251[1088];
  int v252;
  const char *v253;
  __int16 v254;
  void *v255;
  _OWORD v256[105];
  uint64_t v257;
  _OWORD v258[214];
  _BYTE v259[128];
  uint64_t v260;

  v2 = MEMORY[0x1E0C80A78](self);
  v260 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(v2 + 80);
  v3 = *(id *)(v2 + 80);
  if (v3)
    goto LABEL_2;
  v7 = (void *)v2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v5)
    return (NSMutableDictionary *)v5;
  v8 = v5;
  v239 = 0u;
  v238 = 0u;
  v237 = 0u;
  v236 = 0u;
  v235 = 0u;
  v234 = 0u;
  v233 = 0u;
  v232 = 0u;
  v231 = 0u;
  v230 = 0u;
  v229 = 0u;
  v228 = 0u;
  v227 = 0u;
  v226 = 0u;
  v225 = 0u;
  v224 = 0u;
  v223 = 0u;
  v222 = 0u;
  v221 = 0u;
  v220 = 0u;
  v219 = 0u;
  v218 = 0u;
  v217 = 0u;
  v216 = 0u;
  v215 = 0u;
  v214 = 0u;
  v213 = 0u;
  v212 = 0u;
  v211 = 0u;
  v210 = 0u;
  v209 = 0u;
  v208 = 0u;
  objc_msgSend(v7, "report");
  if (!v251[1081])
  {
    v13 = CFSTR("NW_CONNECTION_REPORT_REASON_UNKNOWN");
    switch(DWORD1(v226))
    {
      case 1:
        v13 = CFSTR("NW_CONNECTION_REPORT_REASON_LEGACY");
        break;
      case 2:
        v13 = CFSTR("NW_CONNECTION_REPORT_REASON_GENERIC");
        break;
      case 4:
        v13 = CFSTR("NW_CONNECTION_REPORT_REASON_ACTIVITY");
        break;
      case 8:
        v13 = CFSTR("NW_CONNECTION_REPORT_REASON_PROBE");
        break;
      case 0x10:
        v13 = CFSTR("NW_CONNECTION_REPORT_REASON_PROBE_PARENT");
        break;
      case 0x20:
        v13 = CFSTR("NW_CONNECTION_REPORT_REASON_PROXY_RACE");
        break;
      default:
        break;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("connectionReportReason"));
    if (DWORD1(v228) <= 3)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", off_1E14A9560[DWORD1(v228)], CFSTR("connectionMode"));
    if ((DWORD2(v228) - 1) > 5)
      v39 = CFSTR("NW_APPLE_HOST_NONE");
    else
      v39 = off_1E14A9580[DWORD2(v228) - 1];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v39, CFSTR("appleHost"));
    v199 = v4;
    if ((HIDWORD(v228) - 1) > 8)
      v40 = CFSTR("NW_APPLE_APP_NONE");
    else
      v40 = off_1E14A95B0[HIDWORD(v228) - 1];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v40, CFSTR("appleApp"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 23) & 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v41, CFSTR("isDaemon"));

    if ((v247 & 0x800000) != 0)
    {
      objc_msgSend(v7, "clientIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v42, CFSTR("processName"));

    }
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", &v240, 134217984);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v43, CFSTR("bundleID"));

    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", &v241, 134217984);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v44, CFSTR("effectiveBundleID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(v225));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v45, CFSTR("secondsSinceInterfaceChange"));

    if ((DWORD2(v229) - 1) > 4)
      v46 = CFSTR("NW_STACK_LEVEL_UNDEFINED");
    else
      v46 = off_1E14A95F8[DWORD2(v229) - 1];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v46, CFSTR("stackLevel"));
    +[NWConnectionStatistics protocolToTransportProtocolString:](NWConnectionStatistics, "protocolToTransportProtocolString:", HIDWORD(v225));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v47, CFSTR("transportProtocol"));

    if ((v226 - 1) > 3)
      v48 = CFSTR("NW_DNS_PROTOCOL_UNKNOWN");
    else
      v48 = off_1E14A9620[(v226 - 1)];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v48, CFSTR("dnsProtocol"));
    if ((v229 - 1) > 2)
      v49 = CFSTR("NW_DNS_PROVIDER_UNKNOWN");
    else
      v49 = off_1E14A9640[(v229 - 1)];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v49, CFSTR("dnsProvider"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 29) & 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v50, CFSTR("svcbRequested"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 30) & 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v51, CFSTR("svcbReceived"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v247 >> 31);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v52, CFSTR("svcbDoHURI"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 2) & 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v53, CFSTR("triggeredPath"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 3) & 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v54, CFSTR("systemProxyConfigured"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 4) & 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v55, CFSTR("customProxyConfigured"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("systemProxyConfigured"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {

    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("customProxyConfigure)"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v57)
      {
LABEL_92:
        if ((v245 - 1) > 3u)
          v72 = CFSTR("NW_PROXY_RESULT_NONE");
        else
          v72 = off_1E14A9658[(v245 - 1)];
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v72, CFSTR("proxyResult"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 25) & 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v73, CFSTR("isPathExpensive"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 26) & 1);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v74, CFSTR("isPathConstrained"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 27) & 1);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v75, CFSTR("prohibitsExpensive"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 28) & 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v76, CFSTR("prohibitsConstrained"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v248 & 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v77, CFSTR("isProbe"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 18) & 1);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v78, CFSTR("ipv4Available"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 19) & 1);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v79, CFSTR("ipv6Available"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v225);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v80, CFSTR("ipv4DNSServerCount"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD1(v225));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v81, CFSTR("ipv6DNSServerCount"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 5) & 1);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v82, CFSTR("fallbackEligible"));

        v83 = v247;
        if ((v247 & 0x20) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 6) & 1);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v84, CFSTR("weakFallback"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 7) & 1);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v85, CFSTR("preferFallback"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 8) & 1);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v86, CFSTR("usedFallback"));

          v83 = v247;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v83 >> 9) & 1);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v87, CFSTR("resolutionRequired"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 10) & 1);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v88, CFSTR("tlsConfigured"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 12) & 1);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v89, CFSTR("tfoConfigured"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 20) & 1);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v90, CFSTR("tfoUsed"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 13) & 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v91, CFSTR("multipathConfigured"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v222);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v92, CFSTR("trafficClass"));

        v93 = CFSTR("NW_MPTCP_VERSION_UNKNOWN");
        if (BYTE12(v229) == 1)
          v93 = CFSTR("NW_MPTCP_VERSION_0");
        if (BYTE12(v229) == 2)
          v94 = CFSTR("NW_MPTCP_VERSION_1");
        else
          v94 = v93;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v94, CFSTR("mptcpVersion"));
        v95 = CFSTR("NW_FAILURE_REASON_PATH");
        switch(DWORD1(v227))
        {
          case 0:
            goto LABEL_107;
          case 2:
            v95 = CFSTR("NW_FAILURE_REASON_RESOLVER");
            goto LABEL_106;
          case 3:
            v95 = CFSTR("NW_FAILURE_REASON_FLOW");
            goto LABEL_106;
          case 4:
            v95 = CFSTR("NW_FAILURE_REASON_TLS");
            goto LABEL_106;
          default:
LABEL_106:
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v95, CFSTR("failureReason"));
LABEL_107:
            v96 = v247;
            if ((v247 & 4) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD1(v222));
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v104, CFSTR("pathTriggerMilliseconds"));

              v96 = v247;
              if ((v247 & 0x200) == 0)
              {
LABEL_109:
                if ((v96 & 0x18) == 0)
                  goto LABEL_111;
                goto LABEL_110;
              }
            }
            else if ((v247 & 0x200) == 0)
            {
              goto LABEL_109;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(v222));
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v105, CFSTR("resolutionMilliseconds"));

            v96 = v247;
            if ((v247 & 0x18) == 0)
            {
LABEL_111:
              if ((v96 & 0x4000) != 0)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v223);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v98, CFSTR("flowConnectMilliseconds"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(v223));
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v99, CFSTR("flowDurationMilliseconds"));

                v96 = v247;
              }
              if (v96 < 0)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD1(v223));
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v100, CFSTR("tlsMilliseconds"));

              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v219 + 1));
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v101, CFSTR("attemptDelayMilliseconds"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v220);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v102, CFSTR("attemptEstablishmentMilliseconds"));

              if ((DWORD1(v229) - 1) > 6)
                v103 = CFSTR("NW_TLS_VERSION_NONE");
              else
                v103 = off_1E14A9678[DWORD1(v229) - 1];
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v103, CFSTR("tlsVersion"));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 21) & 1);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v106, CFSTR("tlsVersionTimeout"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIBYTE(v247) & 1);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v107, CFSTR("tlsHandshakeTimedOut"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIBYTE(v248) & 1);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v108, CFSTR("tlsECHEnabled"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v219);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v109, CFSTR("transformLastTimeoutMsecs"));

              +[NWConnectionStatistics protocolToTransportProtocolString:](NWConnectionStatistics, "protocolToTransportProtocolString:", DWORD2(v226));
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v110, CFSTR("transformFirstProtocol"));

              +[NWConnectionStatistics protocolToTransportProtocolString:](NWConnectionStatistics, "protocolToTransportProtocolString:", HIDWORD(v226));
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v111, CFSTR("transformConnectedProtocol"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v227);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v112, CFSTR("transformConnectedProtocolIndex"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v248 >> 2) & 1);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v113, CFSTR("quicDeferred"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v248 >> 3) & 1);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v114, CFSTR("quicApplicationDeferred"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v248 >> 4) & 1);
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v115, CFSTR("quicDenied"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v248 >> 5) & 1);
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v116, CFSTR("quicAlternativePresent"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v248 >> 6) & 1);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v117, CFSTR("quicUpdatedAlternative"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v248 >> 7) & 1);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v118, CFSTR("quicSpeculativeAttempt"));

              if ((v243 - 1) > 8)
                v119 = CFSTR("NW_CONNECTION_CLIENT_ACCURATE_ECN_INVALID");
              else
                v119 = off_1E14A96B0[v243 - 1];
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v119, CFSTR("accurateECNClientState"));
              if ((v244 - 1) > 9)
                v120 = CFSTR("NW_CONNECTION_SERVER_ACCURATE_ECN_INVALID");
              else
                v120 = off_1E14A96F8[v244 - 1];
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v120, CFSTR("accurateECNServerState"));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v248 >> 10) & 1);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v121, CFSTR("l4sEnabled"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v223));
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v122, CFSTR("ipv4AddressCount"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v224);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v123, CFSTR("ipv6AddressCount"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIWORD(v247) & 1);
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v124, CFSTR("synthesizedIPv6Address"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 17) & 1);
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v125, CFSTR("synthesizedExtraIPv6Address"));

              if (BYTE13(v229) == 30)
                v126 = CFSTR("NW_ADDRESS_FAMILY_IPV6");
              else
                v126 = CFSTR("NW_ADDRESS_FAMILY_OTHER");
              if (BYTE13(v229) == 2)
                v127 = CFSTR("NW_ADDRESS_FAMILY_IPV4");
              else
                v127 = v126;
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v127, CFSTR("firstAddressFamily"));
              if ((v247 & 0x4000) != 0)
              {
                if (BYTE14(v229) == 30)
                  v128 = CFSTR("NW_ADDRESS_FAMILY_IPV6");
                else
                  v128 = CFSTR("NW_ADDRESS_FAMILY_OTHER");
                if (BYTE14(v229) == 2)
                  v129 = CFSTR("NW_ADDRESS_FAMILY_IPV4");
                else
                  v129 = v128;
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v129, CFSTR("connectedAddressFamily"));
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD1(v224));
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v130, CFSTR("connectedAddressIndex"));

                if ((DWORD2(v227) - 1) > 3)
                  v131 = CFSTR("INTERFACE_TYPE_OTHER");
                else
                  v131 = off_1E14A9748[DWORD2(v227) - 1];
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v131, CFSTR("connectedInterfaceType"));
                v132 = CFSTR("NW_INTERFACE_SUBTYPE_OTHER");
                v133 = CFSTR("NW_INTERFACE_SUBTYPE_COPROCESSOR");
                v134 = CFSTR("NW_INTERFACE_SUBTYPE_COMPANION");
                if (HIDWORD(v227) != 5001)
                  v134 = CFSTR("NW_INTERFACE_SUBTYPE_OTHER");
                if (HIDWORD(v227) != 4001)
                  v133 = v134;
                if (HIDWORD(v227) == 1002)
                  v132 = CFSTR("NW_INTERFACE_SUBTYPE_WIFI_AWDL");
                if (HIDWORD(v227) == 1001)
                  v132 = CFSTR("NW_INTERFACE_SUBTYPE_WIFI_INFRASTRUCTURE");
                if (SHIDWORD(v227) <= 4000)
                  v135 = v132;
                else
                  v135 = v133;
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v135, CFSTR("connectedInterfaceSubtype"));
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(v224));
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v136, CFSTR("connectionReuseCount"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v224));
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v137, CFSTR("dataStallCount"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v208);
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v138, CFSTR("bytesIn"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v208 + 1));
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v139, CFSTR("bytesOut"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v209);
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v140, CFSTR("bytesDuplicate"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v209 + 1));
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v141, CFSTR("bytesOutOfOrder"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v210);
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v142, CFSTR("bytesRetransmitted"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v210 + 1));
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v143, CFSTR("ecnCapablePacketsSent"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v211);
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v144, CFSTR("ecnCapablePacketsAcked"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v211 + 1));
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v145, CFSTR("ecnCapablePacketsMarked"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v212);
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v146, CFSTR("ecnCapablePacketsLost"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v212 + 1));
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v147, CFSTR("packetsIn"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v213);
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v148, CFSTR("ect1PacketsIn"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v213 + 1));
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v149, CFSTR("ect0PacketsIn"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v214);
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v150, CFSTR("cePacketsIn"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v214 + 1));
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v151, CFSTR("packetsOut"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(v220));
                v152 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v152, CFSTR("currentRTT"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v220));
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v153, CFSTR("smoothedRTT"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v221);
                v154 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v154, CFSTR("bestRTT"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD1(v221));
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v155, CFSTR("rTTvariance"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(v221));
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v156, CFSTR("synRetransmissionCount"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v218);
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v157, CFSTR("estimatedUploadThroughput"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v218 + 1));
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v158, CFSTR("estimatedDownloadThroughput"));

              }
              if (v242 - 1 > 4)
                v159 = CFSTR("NW_PRIVACY_STANCE_UNKNOWN");
              else
                v159 = off_1E14A9768[(v242 - 1)];
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v159, CFSTR("privacyStance"));
              v198 = v7;
              if (v246 - 1 > 9)
                v160 = CFSTR("UNKNOWN");
              else
                v160 = off_1E14A9790[(v246 - 1)];
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v160, CFSTR("privacyProxyClient"));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v247 & 1);
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v161, CFSTR("isKnownTracker"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v247 >> 1) & 1);
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v162, CFSTR("isThirdPartyWebContent"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v248 >> 9) & 1);
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v163, CFSTR("isWebSearchContent"));

              v200 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              for (i = 0; i != 560; i += 56)
              {
                v165 = (char *)&v208 + i;
                if (*(_DWORD *)&v249[i] == -1)
                  break;
                v166 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v165 + 440));
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "setObject:forKeyedSubscript:", v167, CFSTR("protocolIndex"));

                v168 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v165 + 1712, 134217984);
                objc_msgSend(v166, "setObject:forKeyedSubscript:", v168, CFSTR("protocolName"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)v165 + 218));
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "setObject:forKeyedSubscript:", v169, CFSTR("handshakeMilliseconds"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)v165 + 219));
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "setObject:forKeyedSubscript:", v170, CFSTR("handshakeRTTMilliseconds"));

                objc_msgSend(v200, "addObject:", v166);
              }
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v200, CFSTR("protocolEstablishmentReports"));
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v171 = (id)gLogObj;
              if (os_log_type_enabled(v171, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("protocolEstablishmentReports"));
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v258[0]) = 136446466;
                *(_QWORD *)((char *)v258 + 4) = "-[NWConnectionStatistics dictionaryReport]";
                WORD6(v258[0]) = 2112;
                *(_QWORD *)((char *)v258 + 14) = v172;
                _os_log_impl(&dword_182FBE000, v171, OS_LOG_TYPE_DEBUG, "%{public}s Establishment reports: \n%@", (uint8_t *)v258, 0x16u);

              }
              v173 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v4 = v199;
              if (v250[0])
              {
                v174 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                v175 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v250, 134217984);
                objc_msgSend(v174, "setObject:forKeyedSubscript:", v175, CFSTR("proxyName"));

                objc_msgSend(v173, "addObject:", v174);
                if (v251[0])
                {
                  v176 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  v177 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v251, 134217984);
                  objc_msgSend(v176, "setObject:forKeyedSubscript:", v177, CFSTR("proxyName"));

                  objc_msgSend(v173, "addObject:", v176);
                }
              }
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v173, CFSTR("proxyHops"));
              objc_msgSend(v7, "externallyVisibleConnectionUUID");
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v178, "UUIDString");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v179, CFSTR("connectionUUID"));

              objc_msgSend(v7, "externallyVisibleParentUUID");
              v180 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v180, "UUIDString");
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v181, CFSTR("parentUUID"));

              v182 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v204 = 0u;
              v205 = 0u;
              v206 = 0u;
              v207 = 0u;
              objc_msgSend(v7, "externallyVisibleActivityUUIDs");
              v183 = (void *)objc_claimAutoreleasedReturnValue();
              v184 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v204, v259, 16);
              if (v184)
              {
                v185 = v184;
                v186 = *(_QWORD *)v205;
                do
                {
                  for (j = 0; j != v185; ++j)
                  {
                    if (*(_QWORD *)v205 != v186)
                      objc_enumerationMutation(v183);
                    objc_msgSend(*(id *)(*((_QWORD *)&v204 + 1) + 8 * j), "UUIDString");
                    v188 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v182, "addObject:", v188);

                  }
                  v185 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v204, v259, 16);
                }
                while (v185);
              }

              objc_msgSend(v8, "setObject:forKeyedSubscript:", v182, CFSTR("activities"));
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v189 = (id)gLogObj;
              if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("activities"));
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v258[0]) = 136446466;
                *(_QWORD *)((char *)v258 + 4) = "-[NWConnectionStatistics dictionaryReport]";
                WORD6(v258[0]) = 2112;
                *(_QWORD *)((char *)v258 + 14) = v190;
                _os_log_impl(&dword_182FBE000, v189, OS_LOG_TYPE_DEBUG, "%{public}s Activities array: \n%@", (uint8_t *)v258, 0x16u);

              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v248 >> 1) & 1);
              v191 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v191, CFSTR("quicExperimentEnabled"));

              objc_msgSend(v198, "layer2Report");
              v192 = (void *)objc_claimAutoreleasedReturnValue();

              if (v192)
              {
                objc_msgSend(v198, "layer2Report");
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v193, CFSTR("l2Report"));

              }
              objc_msgSend(v198, "deviceReport");
              v194 = (void *)objc_claimAutoreleasedReturnValue();

              if (v194)
              {
                objc_msgSend(v198, "deviceReport");
                v195 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v195, CFSTR("deviceReport"));

              }
              objc_msgSend(v198, "setMetricType:", 2);
              objc_storeStrong(v199, v8);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v196 = (id)gLogObj;
              if (os_log_type_enabled(v196, OS_LOG_TYPE_DEBUG))
              {
                v197 = *v199;
                LODWORD(v258[0]) = 136446466;
                *(_QWORD *)((char *)v258 + 4) = "-[NWConnectionStatistics dictionaryReport]";
                WORD6(v258[0]) = 2114;
                *(_QWORD *)((char *)v258 + 14) = v197;
                _os_log_impl(&dword_182FBE000, v196, OS_LOG_TYPE_DEBUG, "%{public}s Generated nw_connection report: %{public}@", (uint8_t *)v258, 0x16u);
              }

              v33 = v200;
              goto LABEL_185;
            }
LABEL_110:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v222));
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v97, CFSTR("proxyMilliseconds"));

            v96 = v247;
            goto LABEL_111;
        }
      }
    }
    v58 = CFSTR("NW_PROXY_TYPE_INVALID");
    if (SHIDWORD(v221) <= 3000)
    {
      v60 = CFSTR("NW_PROXY_TYPE_PAC_URL");
      v61 = CFSTR("NW_PROXY_TYPE_HTTP");
      v62 = CFSTR("NW_PROXY_TYPE_HTTPS");
      if (HIDWORD(v221) != 2002)
        v62 = CFSTR("NW_PROXY_TYPE_INVALID");
      if (HIDWORD(v221) != 2001)
        v61 = v62;
      if (HIDWORD(v221) != 1002)
        v60 = v61;
      if (HIDWORD(v221) == 1001)
        v58 = CFSTR("NW_PROXY_TYPE_PAC_SCRIPT");
      if (HIDWORD(v221) == 1)
        v58 = CFSTR("NW_PROXY_TYPE_DIRECT");
      if (SHIDWORD(v221) <= 1001)
        v59 = v58;
      else
        v59 = v60;
    }
    else
    {
      switch(HIDWORD(v221))
      {
        case 0xBB9:
          v59 = CFSTR("NW_PROXY_TYPE_SOCKSV4");
          break;
        case 0xBBA:
          v59 = CFSTR("NW_PROXY_TYPE_SOCKSV5");
          break;
        case 0xBBB:
          v59 = CFSTR("NW_PROXY_TYPE_SHOES");
          break;
        case 0xBBC:
          v59 = CFSTR("NW_PROXY_TYPE_HTTP_CONNECT");
          break;
        case 0xBBD:
          v59 = CFSTR("NW_PROXY_TYPE_TCP_CONVERTER");
          break;
        case 0xBBE:
          v59 = CFSTR("NW_PROXY_TYPE_MASQUE");
          break;
        default:
          if (HIDWORD(v221) == 4002)
            v58 = CFSTR("NW_PROXY_TYPE_SECURE_HTTPS");
          if (HIDWORD(v221) == 4001)
            v59 = CFSTR("NW_PROXY_TYPE_HTTPS_TRANSPARENT");
          else
            v59 = v58;
          break;
      }
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v59, CFSTR("usedProxyType"));
    goto LABEL_92;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "report");
    objc_msgSend(v10, "numberWithBool:", v203);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("delegated"));

    objc_msgSend(v7, "report");
    if ((v202 - 2) > 3)
      v12 = CFSTR("NETCORE_STATS_TCP_REPORT_REASON_FALLBACK_SIGNAL");
    else
      v12 = off_1E14A97E0[v202 - 2];
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("reportReason"));
    objc_msgSend(v7, "clientIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("clientIdentifier"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("delegated"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v7, "sourceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("sourceAppIdentifier"));

    }
    objc_msgSend(v7, "_createStatisticsReportDictionaryFromStruct:", &v208);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("connectionStatisticsReport"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("connectionStatisticsReport"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      memset(v258, 0, 512);
      objc_msgSend(v7, "report");
      objc_msgSend(v7, "_createFallbackReportDictionaryFromStruct:", (char *)&v258[13] + 8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("cellularFallbackReport"));

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cellularFallbackReport"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v7, "layer2Report");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v7, "layer2Report");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("cellularRadioTechnology"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cellularFallbackReport"));
          v24 = v7;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, CFSTR("cellularRadioTechnology"));

          objc_msgSend(v24, "layer2Report");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("wifiRadioTechnology"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cellularFallbackReport"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, CFSTR("wifiRadioTechnology"));

          v7 = v24;
          objc_msgSend(v24, "layer2Report");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("cellularBand"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cellularFallbackReport"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("cellularBand"));

          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v32 = (id)gLogObj;
          v33 = v9;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cellularFallbackReport"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v256[0]) = 136446466;
            *(_QWORD *)((char *)v256 + 4) = "-[NWConnectionStatistics dictionaryReport]";
            WORD6(v256[0]) = 2114;
            *(_QWORD *)((char *)v256 + 14) = v34;
            _os_log_impl(&dword_182FBE000, v32, OS_LOG_TYPE_DEBUG, "%{public}s Added radio technology and cellular band to legacy cellular fallback report: %{public}@", (uint8_t *)v256, 0x16u);

          }
        }
        else
        {
          v33 = v9;
          __nwlog_obj();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v256[0]) = 136446210;
            *(_QWORD *)((char *)v256 + 4) = "-[NWConnectionStatistics dictionaryReport]";
            _os_log_impl(&dword_182FBE000, v32, OS_LOG_TYPE_ERROR, "%{public}s Could not add radio technology and cellular band as layer2Report is nil", (uint8_t *)v256, 0xCu);
          }
        }

        v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v7, "report");
        if (v201)
        {
          v64 = 0;
          v65 = &v257;
          while (1)
          {
            memset(v256, 0, 512);
            objc_msgSend(v7, "report");
            objc_msgSend(v7, "_createStatisticsReportDictionaryFromStruct:", v65);
            v66 = objc_claimAutoreleasedReturnValue();
            if (!v66)
              break;
            v67 = (void *)v66;
            objc_msgSend(v63, "addObject:", v66);

            ++v64;
            objc_msgSend(v7, "report");
            v65 += 27;
            if (v64 >= v201)
              goto LABEL_80;
          }
          __nwlog_obj();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "clientIdentifier");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v252 = 136446466;
            v253 = "-[NWConnectionStatistics dictionaryReport]";
            v254 = 2114;
            v255 = v71;
            _os_log_impl(&dword_182FBE000, v70, OS_LOG_TYPE_ERROR, "%{public}s failing to create a fallback report for %{public}@", (uint8_t *)&v252, 0x16u);

          }
          v9 = v33;
          goto LABEL_25;
        }
LABEL_80:
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v63, CFSTR("connectionAttemptStatisticsReports"));
        objc_msgSend(v7, "setMetricType:", 1);
        objc_storeStrong(v4, v33);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v68 = (id)gLogObj;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          v69 = *v4;
          LODWORD(v256[0]) = 136446466;
          *(_QWORD *)((char *)v256 + 4) = "-[NWConnectionStatistics dictionaryReport]";
          WORD6(v256[0]) = 2114;
          *(_QWORD *)((char *)v256 + 14) = v69;
          _os_log_impl(&dword_182FBE000, v68, OS_LOG_TYPE_DEBUG, "%{public}s Generated legacy tcp_connection dictionary report: %{public}@", (uint8_t *)v256, 0x16u);
        }

LABEL_185:
        v3 = *v4;
LABEL_2:
        v5 = v3;
        return (NSMutableDictionary *)v5;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v35 = (id)gLogObj;
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      objc_msgSend(v7, "clientIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v256[0]) = 136446466;
      *(_QWORD *)((char *)v256 + 4) = "-[NWConnectionStatistics dictionaryReport]";
      WORD6(v256[0]) = 2114;
      *(_QWORD *)((char *)v256 + 14) = v36;
      v37 = "%{public}s failing to create a fallback report for %{public}@";
      v38 = (uint8_t *)v256;
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v35 = (id)gLogObj;
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(v7, "clientIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v258[0]) = 136446466;
      *(_QWORD *)((char *)v258 + 4) = "-[NWConnectionStatistics dictionaryReport]";
      WORD6(v258[0]) = 2114;
      *(_QWORD *)((char *)v258 + 14) = v36;
      v37 = "%{public}s failing to allocate NWLibnetcoreConnectionStatisticsReportDictionary for client %{public}@";
      v38 = (uint8_t *)v258;
    }
    _os_log_impl(&dword_182FBE000, v35, OS_LOG_TYPE_ERROR, v37, v38, 0x16u);

    goto LABEL_24;
  }
LABEL_25:

  return (NSMutableDictionary *)0;
}

- (NWConnectionStatistics)initWithTCPReport:(netcore_stats_tcp_report *)a3 length:(unint64_t)a4 clientIdentifier:(id)a5 sourceIdentifier:(id)a6
{
  id v10;
  id v11;
  NWConnectionStatistics *v12;
  NWConnectionStatistics *v13;
  id v14;
  NSObject *v15;
  void *v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  char *backtrace_string;
  _BOOL4 v23;
  _BYTE __dst[3430];
  char v25;
  os_log_type_t v26;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (a4 != 3424)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
      v30 = 2048;
      v31 = 3424;
      v32 = 2048;
      v33 = a4;
      _os_log_impl(&dword_182FBE000, v15, OS_LOG_TYPE_ERROR, "%{public}s failure to initialize statistics object from TCP report, expected size %zd actual size %zd", buf, 0x20u);
    }

    goto LABEL_7;
  }
  v27.receiver = self;
  v27.super_class = (Class)NWConnectionStatistics;
  v12 = -[NWConnectionStatistics init](&v27, sel_init);
  if (!v12)
  {
    __nwlog_obj();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
    v18 = (char *)_os_log_send_and_compose_impl();

    v26 = OS_LOG_TYPE_ERROR;
    v25 = 0;
    if (!__nwlog_fault(v18, &v26, &v25))
      goto LABEL_24;
    if (v26 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v26;
      if (os_log_type_enabled(v19, v26))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
        v21 = "%{public}s [super init] failed";
LABEL_22:
        _os_log_impl(&dword_182FBE000, v19, v20, v21, buf, 0xCu);
      }
    }
    else
    {
      if (v25)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v26;
        v23 = os_log_type_enabled(v19, v26);
        if (backtrace_string)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
            v30 = 2082;
            v31 = (uint64_t)backtrace_string;
            _os_log_impl(&dword_182FBE000, v19, v20, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_24;
        }
        if (!v23)
          goto LABEL_23;
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
        v21 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_22;
      }
      __nwlog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v26;
      if (os_log_type_enabled(v19, v26))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
        v21 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_22;
      }
    }
LABEL_23:

LABEL_24:
    if (v18)
      free(v18);
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v13 = v12;
  memcpy(__dst, a3, 0xD60uLL);
  -[NWConnectionStatistics setReport:](v13, "setReport:", __dst);
  -[NWConnectionStatistics setClientIdentifier:](v13, "setClientIdentifier:", v10);
  -[NWConnectionStatistics setSourceIdentifier:](v13, "setSourceIdentifier:", v11);
  v14 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  -[NWConnectionStatistics setExternallyVisibleActivityUUIDs:](v13, "setExternallyVisibleActivityUUIDs:", v14);

  -[NWConnectionStatistics setExternallyVisibleConnectionUUID:](v13, "setExternallyVisibleConnectionUUID:", 0);
  -[NWConnectionStatistics setExternallyVisibleParentUUID:](v13, "setExternallyVisibleParentUUID:", 0);
LABEL_8:

  return v13;
}

- (NWConnectionStatistics)initWithJSONData:(id)a3
{
  id v4;
  NWConnectionStatistics *v5;
  uint64_t v6;
  id v7;
  NSMutableDictionary *dictionaryReport;
  NWConnectionStatistics *v9;
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
  v22.super_class = (Class)NWConnectionStatistics;
  v5 = -[NWConnectionStatistics init](&v22, sel_init);
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
  v24 = "-[NWConnectionStatistics initWithJSONData:]";
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
        v24 = "-[NWConnectionStatistics initWithJSONData:]";
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
          v24 = "-[NWConnectionStatistics initWithJSONData:]";
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
        v24 = "-[NWConnectionStatistics initWithJSONData:]";
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
        v24 = "-[NWConnectionStatistics initWithJSONData:]";
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

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIdentifier, a3);
}

- (NSUUID)externallyVisibleConnectionUUID
{
  return self->_externallyVisibleConnectionUUID;
}

- (void)setExternallyVisibleConnectionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_externallyVisibleConnectionUUID, a3);
}

- (NSUUID)externallyVisibleParentUUID
{
  return self->_externallyVisibleParentUUID;
}

- (void)setExternallyVisibleParentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_externallyVisibleParentUUID, a3);
}

- (void)setActivities:(id)a3
{
  objc_storeStrong((id *)&self->_activities, a3);
}

- (NSArray)externallyVisibleActivityUUIDs
{
  return self->_externallyVisibleActivityUUIDs;
}

- (void)setExternallyVisibleActivityUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_externallyVisibleActivityUUIDs, a3);
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

- (netcore_stats_tcp_report)report
{
  return (netcore_stats_tcp_report *)memcpy(retstr, &self->_report, sizeof(netcore_stats_tcp_report));
}

- (void)setReport:(netcore_stats_tcp_report *)a3
{
  memcpy(&self->_report, a3, sizeof(self->_report));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryReport, 0);
  objc_storeStrong((id *)&self->_deviceReport, 0);
  objc_storeStrong((id *)&self->_layer2Report, 0);
  objc_storeStrong((id *)&self->_externallyVisibleActivityUUIDs, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_externallyVisibleParentUUID, 0);
  objc_storeStrong((id *)&self->_externallyVisibleConnectionUUID, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

+ (id)protocolToTransportProtocolString:(unsigned int)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("NW_TRANSPORT_PROTOCOL_QUIC");
  v4 = CFSTR("NW_TRANSPORT_PROTOCOL_UNKNOWN");
  if (a3 == 17)
    v4 = CFSTR("NW_TRANSPORT_PROTOCOL_UDP");
  if (a3 != 253)
    v3 = v4;
  if (a3 == 6)
    return CFSTR("NW_TRANSPORT_PROTOCOL_TCP");
  else
    return (id)v3;
}

@end
