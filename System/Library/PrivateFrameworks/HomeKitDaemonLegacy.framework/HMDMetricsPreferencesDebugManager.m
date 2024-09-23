@implementation HMDMetricsPreferencesDebugManager

- (HMDMetricsPreferencesDebugManager)initWithDataSource:(id)a3
{
  id v4;
  HMDMetricsPreferencesDebugManager *v5;
  uint64_t v6;
  HMMLogEventSubmitting *logEventSubmitter;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDMetricsPreferencesDebugManager;
  v5 = -[HMDMetricsPreferencesDebugManager init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "logEventSubmitter");
    v6 = objc_claimAutoreleasedReturnValue();
    logEventSubmitter = v5->_logEventSubmitter;
    v5->_logEventSubmitter = (HMMLogEventSubmitting *)v6;

    objc_msgSend(v4, "dailyScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerDailyTaskRunner:", v5);

  }
  return v5;
}

- (void)submitPreferencesSizeLogEventsForApplicationID:(id)a3 submissionTrigger:(unint64_t)a4
{
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  CFArrayRef v9;
  uint64_t i;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  HMDMetricsPreferencesDebugManager *v14;
  NSObject *v15;
  const __CFString *v16;
  __CFString *v17;
  HMDMetricsPreferencesDebugManager *v18;
  unint64_t v19;
  void *v20;
  HMDPreferencesSizeLogEvent *v21;
  void *v22;
  const __CFString *v23;
  const __CFArray *obj;
  uint64_t v25;
  uint64_t v26;
  void *context;
  uint64_t v28;
  CFTypeRef cf;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  CFTypeRef v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  if (isInternalBuild())
  {
    v7 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v8 = (const __CFString *)*MEMORY[0x1E0C9B250];
    v9 = CFPreferencesCopyKeyList(v6, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v9;
    v26 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v26)
    {
      v25 = *(_QWORD *)v31;
      v23 = v8;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(obj);
          v11 = *(const __CFString **)(*((_QWORD *)&v30 + 1) + 8 * i);
          context = (void *)MEMORY[0x1D17BA0A0]();
          v12 = (const __CFString *)CFPreferencesCopyValue(v11, v6, v7, v8);
          cf = 0;
          v28 = _approximateSizeOfPlistValue(v12, (CFStringRef *)&cf, 0);
          if (v12)
            CFRelease(v12);
          v13 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = self;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = v7;
            v17 = v6;
            v18 = self;
            v19 = a4;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v35 = v20;
            v36 = 2114;
            v37 = v11;
            v38 = 2048;
            v39 = v28;
            v40 = 2112;
            v41 = cf;
            _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Preferences Key: %{public}@ Size of value: %ld Description: %@", buf, 0x2Au);

            a4 = v19;
            self = v18;
            v6 = v17;
            v7 = v16;
            v8 = v23;
          }

          objc_autoreleasePoolPop(v13);
          if (cf)
            CFRelease(cf);
          v21 = -[HMDPreferencesSizeLogEvent initWithApplicationID:preferencesKey:preferencesSize:eventTrigger:]([HMDPreferencesSizeLogEvent alloc], "initWithApplicationID:preferencesKey:preferencesSize:eventTrigger:", v6, v11, v28, a4);
          -[HMDMetricsPreferencesDebugManager logEventSubmitter](v14, "logEventSubmitter");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "submitLogEvent:", v21);

          objc_autoreleasePoolPop(context);
        }
        v26 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v26);
    }

  }
}

- (void)runDailyTask
{
  -[HMDMetricsPreferencesDebugManager submitPreferencesSizeLogEventsForApplicationID:submissionTrigger:](self, "submitPreferencesSizeLogEventsForApplicationID:submissionTrigger:", CFSTR("com.apple.homed"), 0);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
}

@end
