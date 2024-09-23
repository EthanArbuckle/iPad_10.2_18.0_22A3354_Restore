@implementation CDMPlannerServiceGraph

+ (id)requiredDAGServices
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
}

+ (id)requiredCDMGraphServices
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 7;
}

+ (id)responseFeatureStoreStreamId
{
  __CFString *v2;
  __CFString *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
  {
    v2 = CFSTR("CdmPlannerResponse");
    v3 = CFSTR("CdmPlannerResponse");
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315138;
      v7 = "+[CDMPlannerServiceGraph responseFeatureStoreStreamId]";
      _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s Device not on internal build. Not inserting CdmPlannerResponse to FeatureStore.", (uint8_t *)&v6, 0xCu);
    }

    v2 = 0;
  }
  return v2;
}

+ (id)serializeFeatureStoreWithResponseCmd:(id)a3
{
  return 0;
}

- (Class)supportedGraphInputType
{
  return (Class)objc_opt_class();
}

@end
