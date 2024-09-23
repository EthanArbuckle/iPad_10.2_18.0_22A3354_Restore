@implementation DMTConfigurationProfileValidatorBundles

+ (NSArray)macBuddyNetworkProfileValidators
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  +[DMTCertificatePayload supportedPayloadTypes](DMTCertificatePayload, "supportedPayloadTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  +[DMTGlobalHTTPProxyPayload supportedPayloadTypes](DMTGlobalHTTPProxyPayload, "supportedPayloadTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  +[DMTNetworkProxyPayload supportedPayloadTypes](DMTNetworkProxyPayload, "supportedPayloadTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  +[DMTWiFiPayload supportedPayloadTypes](DMTWiFiPayload, "supportedPayloadTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setAllowedPayloadTypes:", v3);
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v12[0] = v7;
  v12[1] = v8;
  v12[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

@end
