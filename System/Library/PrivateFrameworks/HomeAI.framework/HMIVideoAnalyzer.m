@implementation HMIVideoAnalyzer

+ (id)allowedClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)analyzerWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  SEL v16;
  id v17;
  id v18;
  id *v19;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      objc_msgSend(a1, "analyzerWithConfiguration:identifier:remote:error:", v9, v12, 0, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v15 = (void *)_HMFPreconditionFailure();
  return +[HMIVideoAnalyzer analyzerWithConfiguration:identifier:error:](v15, v16, v17, v18, v19);
}

+ (id)analyzerWithConfiguration:(id)a3 identifier:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "analyzerWithConfiguration:identifier:remote:error:", a3, a4, 1, a5);
}

+ (id)analyzerWithConfiguration:(id)a3 identifier:(id)a4 remote:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  HMIVideoAnalyzerClient *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v6 = a5;
  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x220735570]();
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v14;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Creating analyzer with identifier: %@, configuration: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  if (v6)
  {
    v15 = -[HMIVideoAnalyzerClient initWithConfiguration:identifier:]([HMIVideoAnalyzerClient alloc], "initWithConfiguration:identifier:", v9, v10);
  }
  else
  {
    +[HMIVideoAnalyzerScheduler sharedInstance](HMIVideoAnalyzerScheduler, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __70__HMIVideoAnalyzer_analyzerWithConfiguration_identifier_remote_error___block_invoke;
    v18[3] = &unk_24DBEE3F0;
    v19 = v10;
    objc_msgSend(v16, "analyzerWithConfiguration:block:", v9, v18);
    v15 = (HMIVideoAnalyzerClient *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

HMIVideoAnalyzerServer *__70__HMIVideoAnalyzer_analyzerWithConfiguration_identifier_remote_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMIVideoAnalyzerServer *v4;

  v3 = a2;
  v4 = -[HMIVideoAnalyzerServer initWithConfiguration:identifier:]([HMIVideoAnalyzerServer alloc], "initWithConfiguration:identifier:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (HMIVideoAnalyzer)initWithConfiguration:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  HMIVideoAnalyzer *v9;
  HMIVideoAnalyzer *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMIVideoAnalyzerMutableReport *v17;
  HMIVideoAnalyzerMutableReport *report;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMIVideoAnalyzer;
  v9 = -[HMIVideoAnalyzer init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
    if (objc_msgSend(v7, "saveAnalyzerResultsToDisk"))
    {
      v11 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v11, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromDate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v8, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("VideoAnalyzerReport %@ %@"), v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = -[HMIVideoAnalyzerMutableReport initWithName:]([HMIVideoAnalyzerMutableReport alloc], "initWithName:", v16);
      report = v10->_report;
      v10->_report = v17;

    }
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMIVideoAnalyzer *v11;
  NSObject *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMIVideoAnalyzer report](self, "report");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[HMIVideoAnalyzer report](self, "report");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("/tmp/%@.plist"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMIVideoAnalyzer report](self, "report");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeToFile:atomically:", v7, 1);

    v10 = (void *)MEMORY[0x220735570]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_INFO, "%{public}@VideoAnalyzerReport saved (%@)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);

  }
  v14.receiver = self;
  v14.super_class = (Class)HMIVideoAnalyzer;
  -[HMIVideoAnalyzer dealloc](&v14, sel_dealloc);
}

- (void)handleAssetData:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCE88];
  v12 = *MEMORY[0x24BDBCAB0];
  v13 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (void)handleMessageWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (double)delay
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)analyzeFragment:(id)a3 configuration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("configuration");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMIVideoAnalyzer handleAssetData:withOptions:completionHandler:](self, "handleAssetData:withOptions:completionHandler:", v7, v8, 0);
}

- (void)flush
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)flushAsync
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)finish
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)cancel
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)setAnalysisFPS:(double)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)setMonitored:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)setEncode:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (BOOL)encode
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)monitored
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (double)analysisFPS
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)finalizeFragmentResult:(id)a3 homePersonManager:(id)a4 analysisStateManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  HMIVideoAnalyzer *v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = v10;
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLPreferenceForKey:defaultValue:", CFSTR("uploadVideoAnalysisEvent"), 1);

    if (v9)
    {
      objc_msgSend(v8, "frameResults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "na_flatMap:", &__block_literal_global_40);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleNewFaceEvents:", v16);

      if (v13)
      {
        v26 = MEMORY[0x24BDAC760];
        v27 = 3221225472;
        v28 = __82__HMIVideoAnalyzer_finalizeFragmentResult_homePersonManager_analysisStateManager___block_invoke_3;
        v29 = &unk_24DBEE458;
        v30 = v9;
        v31 = self;
        objc_msgSend(v15, "na_each:", &v26);

      }
    }
    +[HMIAnalytics sendEventsForFragmentResult:](HMIAnalytics, "sendEventsForFragmentResult:", v8, v26, v27, v28, v29);
    -[HMIVideoAnalyzer report](self, "report");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[HMIVideoAnalyzer report](self, "report");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzer identifier](self, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "substringToIndex:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzer identifier](self, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appendFragmentResult:forKey:source:redactFrames:", v8, v21, v23, 0);

    }
    return v8;
  }
  else
  {
    v25 = _HMFPreconditionFailure();
    return (id)__82__HMIVideoAnalyzer_finalizeFragmentResult_homePersonManager_analysisStateManager___block_invoke(v25);
  }
}

id __82__HMIVideoAnalyzer_finalizeFragmentResult_homePersonManager_analysisStateManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_46_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __82__HMIVideoAnalyzer_finalizeFragmentResult_homePersonManager_analysisStateManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "face");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "face");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __82__HMIVideoAnalyzer_finalizeFragmentResult_homePersonManager_analysisStateManager___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "UUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "camera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIAnalytics videoAnalyzerDidFindFaceEvent:homePersonManagerUUID:camera:](HMIAnalytics, "videoAnalyzerDidFindFaceEvent:homePersonManagerUUID:camera:", v4, v7, v6);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMIVideoAnalyzer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMIVideoAnalyzerDelegate)delegate
{
  return (HMIVideoAnalyzerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMIHomePersonManager)homePersonManager
{
  return (HMIHomePersonManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHomePersonManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (HMIAnalysisStateManager)analysisStateManager
{
  return (HMIAnalysisStateManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAnalysisStateManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSSet)externalPersonManagers
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExternalPersonManagers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)status
{
  return self->_status;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (HMIVideoAnalyzerConfiguration)configuration
{
  return (HMIVideoAnalyzerConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (HMIVideoAnalyzerState)state
{
  return (HMIVideoAnalyzerState *)objc_getProperty(self, a2, 72, 1);
}

- (HMIVideoAnalyzerMutableReport)report
{
  return (HMIVideoAnalyzerMutableReport *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_externalPersonManagers, 0);
  objc_storeStrong((id *)&self->_analysisStateManager, 0);
  objc_storeStrong((id *)&self->_homePersonManager, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
