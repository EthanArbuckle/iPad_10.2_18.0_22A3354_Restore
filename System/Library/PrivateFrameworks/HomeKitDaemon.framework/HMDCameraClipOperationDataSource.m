@implementation HMDCameraClipOperationDataSource

- (double)operationTimeout
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("clipModelOperationTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)appendData:(id)a3 toStreamingAssetAppendContext:(id)a4 completion:(id)a5
{
  objc_msgSend(a4, "appendSegmentWithData:completionHandler:", a3, a5);
}

- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a4, a3);
}

- (void)submitOperationEvent:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submitLogEvent:", v3);

}

@end
