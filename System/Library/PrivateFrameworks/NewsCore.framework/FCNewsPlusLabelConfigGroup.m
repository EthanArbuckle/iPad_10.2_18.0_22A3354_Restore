@implementation FCNewsPlusLabelConfigGroup

- (FCNewsPlusLabelConfigGroup)initWithConfigDictionary:(id)a3
{
  id v4;
  FCNewsPlusLabelConfigGroup *v5;
  FCNewsPlusLabelConfig *v6;
  void *v7;
  uint64_t v8;
  FCNewsPlusLabelConfig *configForTrialists;
  FCNewsPlusLabelConfig *v10;
  void *v11;
  uint64_t v12;
  FCNewsPlusLabelConfig *configForSubscribers;
  FCNewsPlusLabelConfig *v14;
  void *v15;
  uint64_t v16;
  FCNewsPlusLabelConfig *configForPaidBundleViaOffer;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCNewsPlusLabelConfigGroup;
  v5 = -[FCNewsPlusLabelConfigGroup init](&v19, sel_init);
  if (v5)
  {
    v6 = [FCNewsPlusLabelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("configForTrialists"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[FCNewsPlusLabelConfig initWithConfigDictionary:](v6, "initWithConfigDictionary:", v7);
    configForTrialists = v5->_configForTrialists;
    v5->_configForTrialists = (FCNewsPlusLabelConfig *)v8;

    v10 = [FCNewsPlusLabelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("configForSubscribers"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FCNewsPlusLabelConfig initWithConfigDictionary:](v10, "initWithConfigDictionary:", v11);
    configForSubscribers = v5->_configForSubscribers;
    v5->_configForSubscribers = (FCNewsPlusLabelConfig *)v12;

    v14 = [FCNewsPlusLabelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("configForPaidBundleViaOffer"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FCNewsPlusLabelConfig initWithConfigDictionary:](v14, "initWithConfigDictionary:", v15);
    configForPaidBundleViaOffer = v5->_configForPaidBundleViaOffer;
    v5->_configForPaidBundleViaOffer = (FCNewsPlusLabelConfig *)v16;

  }
  return v5;
}

- (FCNewsPlusLabelConfig)configForTrialists
{
  return self->_configForTrialists;
}

- (FCNewsPlusLabelConfig)configForSubscribers
{
  return self->_configForSubscribers;
}

- (FCNewsPlusLabelConfig)configForPaidBundleViaOffer
{
  return self->_configForPaidBundleViaOffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configForPaidBundleViaOffer, 0);
  objc_storeStrong((id *)&self->_configForSubscribers, 0);
  objc_storeStrong((id *)&self->_configForTrialists, 0);
}

@end
