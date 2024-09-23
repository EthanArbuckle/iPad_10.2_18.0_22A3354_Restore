@implementation ASVConfigurationProvider

+ (id)defaultConfiguration
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setPlaneDetection:", 1);
  objc_msgSend(v2, "setEnvironmentTexturing:", 1);
  return v2;
}

+ (id)configuration
{
  return +[ASVConfigurationProvider defaultConfiguration](ASVConfigurationProvider, "defaultConfiguration");
}

@end
