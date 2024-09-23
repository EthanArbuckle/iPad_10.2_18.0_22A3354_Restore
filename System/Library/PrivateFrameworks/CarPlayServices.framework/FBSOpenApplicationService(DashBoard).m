@implementation FBSOpenApplicationService(DashBoard)

+ (id)dashboardEndpoint
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BE0FA08];
  objc_msgSend(MEMORY[0x24BE38490], "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "endpointForMachName:service:instance:", CFSTR("com.apple.CarPlayApp.service"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)dashboardService
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE38490], "dashboardEndpoint");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x24BE38490], "serviceWithEndpoint:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

@end
