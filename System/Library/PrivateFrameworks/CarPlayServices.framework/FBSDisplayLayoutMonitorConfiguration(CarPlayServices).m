@implementation FBSDisplayLayoutMonitorConfiguration(CarPlayServices)

+ (id)crs_endpointForInstance:()CarPlayServices
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE38438];
  v4 = a3;
  objc_msgSend(v3, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0FA08], "endpointForMachName:service:instance:", CFSTR("com.apple.CarPlayApp.non-launching-service"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)crs_endpointForCarDisplayMonitor
{
  return objc_msgSend(MEMORY[0x24BE38448], "crs_endpointForInstance:", CFSTR("com.apple.CarPlayApp.Dashboard"));
}

+ (uint64_t)crs_endpointForCarInstrumentsDisplayMonitor
{
  return objc_msgSend(MEMORY[0x24BE38448], "crs_endpointForInstance:", CFSTR("com.apple.CarPlayApp.InstrumentCluster"));
}

+ (id)configurationForCarDisplayMonitor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE38448], "crs_endpointForCarDisplayMonitor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x24BE38448], "configurationWithEndpoint:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

+ (id)configurationForCarInstrumentsDisplayMonitor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE38448], "crs_endpointForCarInstrumentsDisplayMonitor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x24BE38448], "configurationWithEndpoint:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

@end
