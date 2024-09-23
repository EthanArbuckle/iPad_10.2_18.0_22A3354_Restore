@implementation HBXHealthAppPluginUtilities

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatorPathOverride, 0);
}

+ (id)defaultUtilities
{
  return -[HBXHealthAppPluginUtilities initWithConfigurationOverride:]([HBXHealthAppPluginUtilities alloc], "initWithConfigurationOverride:", 0);
}

- (HBXHealthAppPluginUtilities)initWithConfigurationOverride:(int64_t)a3
{
  HBXHealthAppPluginUtilities *result;

  result = -[HBXHealthAppPluginUtilities init](self, "init");
  if (result)
    result->_configurationOverride = a3;
  return result;
}

- (NSString)feedItemPluginsPath
{
  void *v2;
  void *v3;

  -[HBXHealthAppPluginUtilities _rootPath](self, "_rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/System/Library/Health/FeedItemPlugins"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_rootPath
{
  __CFString *v3;
  void *v4;

  if (-[HBXHealthAppPluginUtilities _isCatalyst](self, "_isCatalyst"))
  {
    v3 = CFSTR("/System/iOSSupport/");
  }
  else
  {
    -[HBXHealthAppPluginUtilities _simulatorPath](self, "_simulatorPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v3 = v4;
    else
      v3 = CFSTR("/");

  }
  return v3;
}

- (id)_simulatorPath
{
  int64_t configurationOverride;
  void *v3;
  void *v4;
  void *v5;

  configurationOverride = self->_configurationOverride;
  if (configurationOverride)
  {
    if (configurationOverride == 2)
    {
      -[HBXHealthAppPluginUtilities simulatorPathOverride](self, "simulatorPathOverride");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SIMULATOR_ROOT"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)_isCatalyst
{
  return self->_configurationOverride == 3;
}

- (NSString)systemPath
{
  void *v2;
  void *v3;

  -[HBXHealthAppPluginUtilities _rootPath](self, "_rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/System"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)simulatorPathOverride
{
  return self->_simulatorPathOverride;
}

- (void)setSimulatorPathOverride:(id)a3
{
  objc_storeStrong((id *)&self->_simulatorPathOverride, a3);
}

@end
