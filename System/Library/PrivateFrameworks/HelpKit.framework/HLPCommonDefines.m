@implementation HLPCommonDefines

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_11);
  return isInternalBuild__isInternal;
}

uint64_t __35__HLPCommonDefines_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isInternalBuild__isInternal = result;
  return result;
}

+ (BOOL)isVisionOS
{
  if (isVisionOS_onceToken != -1)
    dispatch_once(&isVisionOS_onceToken, &__block_literal_global_2);
  return isVisionOS__isVisionOS;
}

void __30__HLPCommonDefines_isVisionOS__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isVisionOS__isVisionOS = objc_msgSend(v0, "userInterfaceIdiom") == 6;

}

+ (void)setAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&kHLPAuthenticationContext, a3);
}

+ (id)userName
{
  return (id)objc_msgSend((id)kHLPAuthenticationContext, "objectForKeyedSubscript:", CFSTR("user-name"));
}

+ (id)clientID
{
  return (id)objc_msgSend((id)kHLPAuthenticationContext, "objectForKeyedSubscript:", CFSTR("client-id"));
}

+ (id)contentServiceTicket
{
  return (id)objc_msgSend((id)kHLPAuthenticationContext, "objectForKeyedSubscript:", CFSTR("content-service-ticket"));
}

+ (id)assetServiceTicket
{
  return (id)objc_msgSend((id)kHLPAuthenticationContext, "objectForKeyedSubscript:", CFSTR("asset-service-ticket"));
}

+ (BOOL)hasServiceTicket
{
  return kHLPAuthenticationContext
      && +[HLPCommonDefines isInternalBuild](HLPCommonDefines, "isInternalBuild");
}

+ (id)contentRequestHeaderFields
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (!+[HLPCommonDefines hasServiceTicket](HLPCommonDefines, "hasServiceTicket"))
    return 0;
  +[HLPCommonDefines contentServiceTicket](HLPCommonDefines, "contentServiceTicket");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HLPCommonDefines userName](HLPCommonDefines, "userName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v7 = 0;
  }
  else
  {
    v8[0] = CFSTR("X-AppleConnect-Token");
    v8[1] = CFSTR("X-AppleConnect-User");
    v9[0] = v2;
    v9[1] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)assetRequestHeaderFields
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  if (!+[HLPCommonDefines hasServiceTicket](HLPCommonDefines, "hasServiceTicket"))
    return 0;
  +[HLPCommonDefines assetServiceTicket](HLPCommonDefines, "assetServiceTicket");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HLPCommonDefines userName](HLPCommonDefines, "userName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HLPCommonDefines clientID](HLPCommonDefines, "clientID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v2)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (v6 || v4 == 0)
  {
    v9 = 0;
  }
  else
  {
    v10[0] = CFSTR("X-AppleConnect-Token");
    v10[1] = CFSTR("X-AppleConnect-User");
    v11[0] = v2;
    v11[1] = v3;
    v10[2] = CFSTR("X-Client-Id");
    v11[2] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end
