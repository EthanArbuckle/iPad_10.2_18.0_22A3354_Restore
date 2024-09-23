@implementation CMOdometerData(HealthDaemon)

- (uint64_t)hd_compare:()HealthDaemon
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "hd_datestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hd_datestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (uint64_t)hd_sourceID
{
  return 0;
}

- (uint64_t)hd_unitForType:()HealthDaemon
{
  return objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
}

@end
