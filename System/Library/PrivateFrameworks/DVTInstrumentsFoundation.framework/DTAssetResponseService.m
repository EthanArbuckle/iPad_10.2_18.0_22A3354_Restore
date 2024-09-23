@implementation DTAssetResponseService

+ (void)registerCapabilities:(id)a3
{
  objc_msgSend(a3, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.assets.response"), 2, a1);
}

- (void)messageReceived:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[DTAssetResponseBroker sharedBroker](DTAssetResponseBroker, "sharedBroker");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forwardMessage:", v3);

}

- (id)canContinueServingRequestWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a3;
  +[DTAssetResponseBroker sharedBroker](DTAssetResponseBroker, "sharedBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canContinueServingRequestWithIdentifier:", v4);

  objc_msgSend(v3, "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
