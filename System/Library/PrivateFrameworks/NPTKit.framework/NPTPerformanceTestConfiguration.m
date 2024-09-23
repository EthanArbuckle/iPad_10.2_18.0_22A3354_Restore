@implementation NPTPerformanceTestConfiguration

- (NetworkQualityConfiguration)NQConfiguration
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BEDCBF0]);
  objc_msgSend(v3, "setMaxRuntime:", 180);
  if (!-[NPTPerformanceTestConfiguration multiStream](self, "multiStream"))
  {
    objc_msgSend(v3, "setMaxDownloadFlows:", 1);
    objc_msgSend(v3, "setMaxUploadFlows:", 1);
  }
  if (-[NPTPerformanceTestConfiguration interfaceType](self, "interfaceType") != 3)
  {
    -[NPTPerformanceTestConfiguration interfaceName](self, "interfaceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNetworkInterfaceName:", v4);

  }
  if (-[NPTPerformanceTestConfiguration testDuration](self, "testDuration"))
  {
    objc_msgSend(v3, "setMaxRuntime:", 2 * -[NPTPerformanceTestConfiguration testDuration](self, "testDuration"));
    if (!-[NPTPerformanceTestConfiguration endWhenStable](self, "endWhenStable"))
      objc_msgSend(v3, "setMinRuntime:", -[NPTPerformanceTestConfiguration testDuration](self, "testDuration"));
  }
  if (-[NPTPerformanceTestConfiguration downloadSize](self, "downloadSize") != 1001
    && (!-[NPTPerformanceTestConfiguration testDuration](self, "testDuration")
     || -[NPTPerformanceTestConfiguration stopAtFileSize](self, "stopAtFileSize")))
  {
    objc_msgSend(v3, "setMaxDownlinkData:", +[NPTFileSizeConverter getFileSizeInBytes:](NPTFileSizeConverter, "getFileSizeInBytes:", -[NPTPerformanceTestConfiguration downloadSize](self, "downloadSize")));
    if (!-[NPTPerformanceTestConfiguration testDuration](self, "testDuration")
      && !-[NPTPerformanceTestConfiguration endWhenStable](self, "endWhenStable"))
    {
      objc_msgSend(v3, "setMinRuntime:", 179);
    }
  }
  if (-[NPTPerformanceTestConfiguration uploadSize](self, "uploadSize") != 1001
    && (!-[NPTPerformanceTestConfiguration testDuration](self, "testDuration")
     || -[NPTPerformanceTestConfiguration stopAtFileSize](self, "stopAtFileSize")))
  {
    objc_msgSend(v3, "setMaxUplinkData:", +[NPTFileSizeConverter getFileSizeInBytes:](NPTFileSizeConverter, "getFileSizeInBytes:", -[NPTPerformanceTestConfiguration uploadSize](self, "uploadSize")));
    if (!-[NPTPerformanceTestConfiguration testDuration](self, "testDuration")
      && !-[NPTPerformanceTestConfiguration endWhenStable](self, "endWhenStable"))
    {
      objc_msgSend(v3, "setMinRuntime:", 179);
    }
  }
  return (NetworkQualityConfiguration *)v3;
}

- (NetworkQualityConfiguration)NQDownloadConfiguration
{
  void *v2;

  -[NPTPerformanceTestConfiguration NQConfiguration](self, "NQConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setParallel:", 0);
  objc_msgSend(v2, "setDownload:", 1);
  objc_msgSend(v2, "setUpload:", 0);
  return (NetworkQualityConfiguration *)v2;
}

- (NetworkQualityConfiguration)NQUploadConfiguration
{
  void *v2;

  -[NPTPerformanceTestConfiguration NQConfiguration](self, "NQConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setParallel:", 0);
  objc_msgSend(v2, "setDownload:", 0);
  objc_msgSend(v2, "setUpload:", 1);
  return (NetworkQualityConfiguration *)v2;
}

- (NPTPerformanceTestConfiguration)init
{
  NPTPerformanceTestConfiguration *v2;
  NPTPerformanceTestConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPTPerformanceTestConfiguration;
  v2 = -[NPTPerformanceTestConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NPTPerformanceTestConfiguration setDownloadSize:](v2, "setDownloadSize:", 1000);
    -[NPTPerformanceTestConfiguration setUploadSize:](v3, "setUploadSize:", 50);
    -[NPTPerformanceTestConfiguration setUseSecureConnection:](v3, "setUseSecureConnection:", 1);
    -[NPTPerformanceTestConfiguration setPingAddressStyle:](v3, "setPingAddressStyle:", 0);
    -[NPTPerformanceTestConfiguration setPingCount:](v3, "setPingCount:", 10);
    -[NPTPerformanceTestConfiguration setCollectMetadata:](v3, "setCollectMetadata:", 1);
    -[NPTPerformanceTestConfiguration setInterfaceType:](v3, "setInterfaceType:", 3);
    -[NPTPerformanceTestConfiguration setConcurrentStreams:](v3, "setConcurrentStreams:", 1);
    -[NPTPerformanceTestConfiguration setUuid:](v3, "setUuid:", 0);
    -[NPTPerformanceTestConfiguration setTestDuration:](v3, "setTestDuration:", 0);
    -[NPTPerformanceTestConfiguration setStopAtFileSize:](v3, "setStopAtFileSize:", 0);
    -[NPTPerformanceTestConfiguration setCollectWRMMetrics:](v3, "setCollectWRMMetrics:", 0);
    -[NPTPerformanceTestConfiguration setMultiStream:](v3, "setMultiStream:", 1);
    v3->privateLegacyMode = 1;
  }
  return v3;
}

- (NSURL)uploadURL
{
  NSURL *privateUploadURL;

  privateUploadURL = self->privateUploadURL;
  if (privateUploadURL)
    return privateUploadURL;
  -[NPTPerformanceTestConfiguration cdnUploadURL](self, "cdnUploadURL");
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)cdnUploadURL
{
  __CFString *v3;
  uint64_t v4;
  void *v5;

  v3 = CFSTR("https://npt.cdn-apple.com/slurp");
  if (!-[NPTPerformanceTestConfiguration useSecureConnection](self, "useSecureConnection"))
  {
    -[__CFString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("https://"), CFSTR("http://"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v4;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSURL)downloadURL
{
  NSURL *privateDownloadURL;

  privateDownloadURL = self->privateDownloadURL;
  if (privateDownloadURL)
    return privateDownloadURL;
  -[NPTPerformanceTestConfiguration cdnDownloadURL](self, "cdnDownloadURL");
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)cdnDownloadURL
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = CFSTR("https://npt.cdn-apple.com/salty");
  if (!-[NPTPerformanceTestConfiguration useSecureConnection](self, "useSecureConnection"))
  {
    -[__CFString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("https://"), CFSTR("http://"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v4;
  }
  +[NPTFileSizeConverter getFileSizeAsString:](NPTFileSizeConverter, "getFileSizeAsString:", -[NPTPerformanceTestConfiguration downloadSize](self, "downloadSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NPTPerformanceTestConfiguration testDuration](self, "testDuration")
    && !-[NPTPerformanceTestConfiguration stopAtFileSize](self, "stopAtFileSize")
    && -[NPTPerformanceTestConfiguration downloadSize](self, "downloadSize") == 1001)
  {
    +[NPTFileSizeConverter getFileSizeAsString:](NPTFileSizeConverter, "getFileSizeAsString:", 1000);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)pingHost
{
  if (self->privatePingHost)
    return self->privatePingHost;
  else
    return (NSString *)CFSTR("npt.cdn-apple.com");
}

- (NSString)clientName
{
  NSString *privateClientName;
  NSString *v3;
  void *v4;

  privateClientName = self->privateClientName;
  if (privateClientName)
  {
    v3 = privateClientName;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)legacyMode
{
  return -[NPTPerformanceTestConfiguration customURLSet](self, "customURLSet") || self->privateLegacyMode;
}

- (BOOL)forceWiFi
{
  return -[NPTPerformanceTestConfiguration interfaceType](self, "interfaceType") == 1;
}

- (BOOL)customURLSet
{
  return self->privateUploadURL || self->privateDownloadURL != 0;
}

+ (id)defaultConfiguration
{
  return objc_alloc_init(NPTPerformanceTestConfiguration);
}

+ (id)defaultConfigurationWiFi
{
  NPTPerformanceTestConfiguration *v2;

  v2 = objc_alloc_init(NPTPerformanceTestConfiguration);
  -[NPTPerformanceTestConfiguration setInterfaceType:](v2, "setInterfaceType:", 1);
  return v2;
}

+ (id)defaultConfigurationWiredEthernet
{
  NPTPerformanceTestConfiguration *v2;

  v2 = objc_alloc_init(NPTPerformanceTestConfiguration);
  -[NPTPerformanceTestConfiguration setInterfaceType:](v2, "setInterfaceType:", 2);
  return v2;
}

+ (id)defaultConfigurationCellular
{
  NPTPerformanceTestConfiguration *v2;

  v2 = objc_alloc_init(NPTPerformanceTestConfiguration);
  -[NPTPerformanceTestConfiguration setInterfaceType:](v2, "setInterfaceType:", 0);
  return v2;
}

+ (id)fileSizeConfigurationWithTimeout:(int)a3 timeout:(unint64_t)a4 downloadFileSize:(int)a5 uploadFileSize:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  NPTPerformanceTestConfiguration *v10;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a3;
  v10 = objc_alloc_init(NPTPerformanceTestConfiguration);
  -[NPTPerformanceTestConfiguration setInterfaceType:](v10, "setInterfaceType:", v9);
  -[NPTPerformanceTestConfiguration setTestDuration:](v10, "setTestDuration:", a4);
  -[NPTPerformanceTestConfiguration setStopAtFileSize:](v10, "setStopAtFileSize:", 1);
  -[NPTPerformanceTestConfiguration setDownloadSize:](v10, "setDownloadSize:", v7);
  -[NPTPerformanceTestConfiguration setUploadSize:](v10, "setUploadSize:", v6);
  return v10;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->privateClientName, a3);
}

- (void)setDownloadURL:(id)a3
{
  objc_storeStrong((id *)&self->privateDownloadURL, a3);
}

- (void)setUploadURL:(id)a3
{
  objc_storeStrong((id *)&self->privateUploadURL, a3);
}

- (void)setPingHost:(id)a3
{
  objc_storeStrong((id *)&self->privatePingHost, a3);
}

- (void)setInterfaceType:(int)a3
{
  id v4;

  self->_interfaceType = a3;
  +[NPTPerformanceTestConfiguration evaluateInterfaceName:](NPTPerformanceTestConfiguration, "evaluateInterfaceName:", -[NPTPerformanceTestConfiguration interfaceType](self, "interfaceType"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NPTPerformanceTestConfiguration setInterfaceName:](self, "setInterfaceName:", v4);

}

- (void)setLegacyMode:(BOOL)a3
{
  self->privateLegacyMode = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NPTPerformanceTestConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[NPTPerformanceTestConfiguration init](+[NPTPerformanceTestConfiguration allocWithZone:](NPTPerformanceTestConfiguration, "allocWithZone:", a3), "init");
  -[NPTPerformanceTestConfiguration setInterfaceType:](v4, "setInterfaceType:", -[NPTPerformanceTestConfiguration interfaceType](self, "interfaceType"));
  -[NPTPerformanceTestConfiguration setDownloadSize:](v4, "setDownloadSize:", -[NPTPerformanceTestConfiguration downloadSize](self, "downloadSize"));
  -[NPTPerformanceTestConfiguration setUploadSize:](v4, "setUploadSize:", -[NPTPerformanceTestConfiguration uploadSize](self, "uploadSize"));
  -[NPTPerformanceTestConfiguration setUseSecureConnection:](v4, "setUseSecureConnection:", -[NPTPerformanceTestConfiguration useSecureConnection](self, "useSecureConnection"));
  -[NPTPerformanceTestConfiguration setPingAddressStyle:](v4, "setPingAddressStyle:", -[NPTPerformanceTestConfiguration pingAddressStyle](self, "pingAddressStyle"));
  -[NPTPerformanceTestConfiguration setPingCount:](v4, "setPingCount:", -[NPTPerformanceTestConfiguration pingCount](self, "pingCount"));
  -[NPTPerformanceTestConfiguration setCollectMetadata:](v4, "setCollectMetadata:", -[NPTPerformanceTestConfiguration collectMetadata](self, "collectMetadata"));
  -[NPTPerformanceTestConfiguration downloadURL](self, "downloadURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPerformanceTestConfiguration setDownloadURL:](v4, "setDownloadURL:", v5);

  -[NPTPerformanceTestConfiguration uploadURL](self, "uploadURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPerformanceTestConfiguration setUploadURL:](v4, "setUploadURL:", v6);

  -[NPTPerformanceTestConfiguration pingHost](self, "pingHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPerformanceTestConfiguration setPingHost:](v4, "setPingHost:", v7);

  -[NPTPerformanceTestConfiguration setConcurrentStreams:](v4, "setConcurrentStreams:", -[NPTPerformanceTestConfiguration concurrentStreams](self, "concurrentStreams"));
  -[NPTPerformanceTestConfiguration uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPerformanceTestConfiguration setUuid:](v4, "setUuid:", v8);

  -[NPTPerformanceTestConfiguration clientName](self, "clientName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPerformanceTestConfiguration setClientName:](v4, "setClientName:", v9);

  -[NPTPerformanceTestConfiguration setTestDuration:](v4, "setTestDuration:", -[NPTPerformanceTestConfiguration testDuration](self, "testDuration"));
  -[NPTPerformanceTestConfiguration setEndWhenStable:](v4, "setEndWhenStable:", -[NPTPerformanceTestConfiguration endWhenStable](self, "endWhenStable"));
  -[NPTPerformanceTestConfiguration setStopAtFileSize:](v4, "setStopAtFileSize:", -[NPTPerformanceTestConfiguration stopAtFileSize](self, "stopAtFileSize"));
  -[NPTPerformanceTestConfiguration setCollectWRMMetrics:](v4, "setCollectWRMMetrics:", -[NPTPerformanceTestConfiguration collectWRMMetrics](self, "collectWRMMetrics"));
  -[NPTPerformanceTestConfiguration setLegacyMode:](v4, "setLegacyMode:", -[NPTPerformanceTestConfiguration legacyMode](self, "legacyMode"));
  -[NPTPerformanceTestConfiguration setMultiStream:](v4, "setMultiStream:", -[NPTPerformanceTestConfiguration multiStream](self, "multiStream"));
  return v4;
}

+ (id)evaluateInterfaceName:(int)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(MEMORY[0x24BDE07E0]);
  v5 = v4;
  if (a3 > 2)
  {
    v6 = 0;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "setRequiredInterfaceType:", qword_20E75C318[a3]);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE07E8]), "initWithEndpoint:parameters:", 0, v5);
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "interfaceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)interfaceServiceName:(int)a3
{
  if (a3 > 2)
    return CFSTR("Unspecified");
  else
    return off_24C9915E0[a3];
}

- (NSDictionary)asDictionary
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTPerformanceTestConfiguration clientName](self, "clientName");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("Unknown");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("calling_client"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NPTPerformanceTestConfiguration collectMetadata](self, "collectMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("collect_metadata"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NPTPerformanceTestConfiguration concurrentStreams](self, "concurrentStreams"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("concurrent_stream_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NPTPerformanceTestConfiguration testDuration](self, "testDuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NPTPerformanceTestConfiguration endWhenStable](self, "endWhenStable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("end_when_stable"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NPTPerformanceTestConfiguration collectWRMMetrics](self, "collectWRMMetrics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("collect_wrm_metrics"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NPTPerformanceTestConfiguration stopAtFileSize](self, "stopAtFileSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("stop_at_file_size"));

  -[NPTPerformanceTestConfiguration interfaceName](self, "interfaceName");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("Unknown");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("interface_name"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NPTPerformanceTestConfiguration interfaceType](self, "interfaceType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("interface_type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", +[NPTFileSizeConverter getFileSizeInBytes:](NPTFileSizeConverter, "getFileSizeInBytes:", -[NPTPerformanceTestConfiguration downloadSize](self, "downloadSize")));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("download_file_size"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", +[NPTFileSizeConverter getFileSizeInBytes:](NPTFileSizeConverter, "getFileSizeInBytes:", -[NPTPerformanceTestConfiguration uploadSize](self, "uploadSize")));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("upload_file_size"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NPTPerformanceTestConfiguration customURLSet](self, "customURLSet"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("custom_url_set"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->privateDownloadURL != 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("custom_download_url_set"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->privateUploadURL != 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("custom_upload_url_set"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NPTPerformanceTestConfiguration legacyMode](self, "legacyMode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("legacy"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NPTPerformanceTestConfiguration multiStream](self, "multiStream"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("multi_stream"));

  return (NSDictionary *)v3;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  int64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[NPTPerformanceTestConfiguration testDuration](self, "testDuration");
  if (-[NPTPerformanceTestConfiguration endWhenStable](self, "endWhenStable"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = -[NPTPerformanceTestConfiguration concurrentStreams](self, "concurrentStreams");
  if (-[NPTPerformanceTestConfiguration customURLSet](self, "customURLSet"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[NPTPerformanceTestConfiguration useSecureConnection](self, "useSecureConnection"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  +[NPTPerformanceTestConfiguration interfaceServiceName:](NPTPerformanceTestConfiguration, "interfaceServiceName:", -[NPTPerformanceTestConfiguration interfaceType](self, "interfaceType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NPTPerformanceTestConfiguration legacyMode](self, "legacyMode"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Test Duration: %lu, End when stable: %@, Number of concurrent streams: %lu,\nCustom URL set: %@, Use Secure Connection: %@, Interface type: %@, Legacy Mode: %@ \n"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPTPerformanceTestConfiguration interfaceName](self, "interfaceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    -[NPTPerformanceTestConfiguration interfaceName](self, "interfaceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR(", interface name: %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringByAppendingString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v16;
  }
  return v11;
}

- (BOOL)useSecureConnection
{
  return self->_useSecureConnection;
}

- (void)setUseSecureConnection:(BOOL)a3
{
  self->_useSecureConnection = a3;
}

- (int)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(int)a3
{
  self->_downloadSize = a3;
}

- (int)uploadSize
{
  return self->_uploadSize;
}

- (void)setUploadSize:(int)a3
{
  self->_uploadSize = a3;
}

- (unint64_t)pingCount
{
  return self->_pingCount;
}

- (void)setPingCount:(unint64_t)a3
{
  self->_pingCount = a3;
}

- (int)pingAddressStyle
{
  return self->_pingAddressStyle;
}

- (void)setPingAddressStyle:(int)a3
{
  self->_pingAddressStyle = a3;
}

- (BOOL)collectMetadata
{
  return self->_collectMetadata;
}

- (void)setCollectMetadata:(BOOL)a3
{
  self->_collectMetadata = a3;
}

- (int64_t)concurrentStreams
{
  return self->_concurrentStreams;
}

- (void)setConcurrentStreams:(int64_t)a3
{
  self->_concurrentStreams = a3;
}

- (int)interfaceType
{
  return self->_interfaceType;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unint64_t)testDuration
{
  return self->_testDuration;
}

- (void)setTestDuration:(unint64_t)a3
{
  self->_testDuration = a3;
}

- (BOOL)endWhenStable
{
  return self->_endWhenStable;
}

- (void)setEndWhenStable:(BOOL)a3
{
  self->_endWhenStable = a3;
}

- (BOOL)stopAtFileSize
{
  return self->_stopAtFileSize;
}

- (void)setStopAtFileSize:(BOOL)a3
{
  self->_stopAtFileSize = a3;
}

- (BOOL)collectWRMMetrics
{
  return self->_collectWRMMetrics;
}

- (void)setCollectWRMMetrics:(BOOL)a3
{
  self->_collectWRMMetrics = a3;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceName, a3);
}

- (BOOL)multiStream
{
  return self->_multiStream;
}

- (void)setMultiStream:(BOOL)a3
{
  self->_multiStream = a3;
}

- (NSString)bonjourHost
{
  return self->_bonjourHost;
}

- (void)setBonjourHost:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourHost, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bonjourHost, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->privateClientName, 0);
  objc_storeStrong((id *)&self->privatePingHost, 0);
  objc_storeStrong((id *)&self->privateUploadURL, 0);
  objc_storeStrong((id *)&self->privateDownloadURL, 0);
}

@end
