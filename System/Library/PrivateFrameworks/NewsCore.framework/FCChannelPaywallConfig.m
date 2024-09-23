@implementation FCChannelPaywallConfig

- (FCChannelPaywallConfig)initWithChannelID:(id)a3 configDictionary:(id)a4
{
  id v6;
  id v7;
  FCChannelPaywallConfig *v8;
  uint64_t v9;
  NSString *channelID;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCChannelPaywallConfig;
  v8 = -[FCChannelPaywallConfig init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    channelID = v8->_channelID;
    v8->_channelID = (NSString *)v9;

    v8->_filterALaCartePaidArticlesForPaidBundleSubscribers = FCAppConfigurationBoolValue(v7, (uint64_t)CFSTR("filterALaCartePaidArticlesForPaidBundleSubscribers"), 0);
    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("articleSoftPaywallPosition"), CFSTR("bottom"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("top")))
    {
      v12 = 2;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("bottom"))
           || !objc_msgSend(v11, "isEqualToString:", CFSTR("none")))
    {
      v12 = 3;
    }
    else
    {
      v12 = 1;
    }
    v8->_articleSoftPaywallPosition = v12;
    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("articleSoftPaywallPositionForPaidBundleSubscribers"), CFSTR("none"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("top")) & 1) != 0)
    {
      v14 = 2;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("bottom")) & 1) != 0)
    {
      v14 = 3;
    }
    else
    {
      objc_msgSend(v13, "isEqualToString:", CFSTR("none"));
      v14 = 1;
    }
    v8->_articleSoftPaywallPositionForPaidBundleSubscribers = v14;

  }
  return v8;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (BOOL)filterALaCartePaidArticlesForPaidBundleSubscribers
{
  return self->_filterALaCartePaidArticlesForPaidBundleSubscribers;
}

- (unint64_t)articleSoftPaywallPosition
{
  return self->_articleSoftPaywallPosition;
}

- (unint64_t)articleSoftPaywallPositionForPaidBundleSubscribers
{
  return self->_articleSoftPaywallPositionForPaidBundleSubscribers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelID, 0);
}

@end
