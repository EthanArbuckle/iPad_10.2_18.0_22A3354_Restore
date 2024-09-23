@implementation FCChannelUpsellConfig

- (FCChannelUpsellConfig)initWithChannelID:(id)a3 configDictionary:(id)a4
{
  id v7;
  id v8;
  FCChannelUpsellConfig *v9;
  FCChannelUpsellConfig *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  FCChannelUpsellTrigger *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *triggersByMethod;
  FCEmailSignupConfig *v22;
  void *v23;
  uint64_t v24;
  FCEmailSignupConfig *emailSignupConfiguration;
  void *v26;
  FCHideMyEmailSignupConfig *v27;
  FCHideMyEmailSignupConfig *hideMyEmailSignupConfiguration;
  void *v29;
  FCSIWAPurchaseConfig *v30;
  FCSIWAPurchaseConfig *siwaPurchaseConfiguration;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)FCChannelUpsellConfig;
  v9 = -[FCChannelUpsellConfig init](&v38, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_channelID, a3);
    v33 = v8;
    FCAppConfigurationArrayValueWithDefaultValue(v8, (uint64_t)CFSTR("triggers"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v13);
          v18 = -[FCChannelUpsellTrigger initWithConfigDictionary:]([FCChannelUpsellTrigger alloc], "initWithConfigDictionary:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCChannelUpsellTrigger triggerMethod](v18, "triggerMethod"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v12);
    v20 = objc_claimAutoreleasedReturnValue();
    triggersByMethod = v10->_triggersByMethod;
    v10->_triggersByMethod = (NSDictionary *)v20;

    v8 = v33;
    v10->_presentationCap = FCAppConfigurationIntegerValue(v33, (uint64_t)CFSTR("presentationCap"), 1);
    v10->_presentationCountResetInterval = FCAppConfigurationIntegerValue(v33, (uint64_t)CFSTR("presentationCountResetInterval"), 0);
    v10->_quiescenceInterval = FCAppConfigurationIntegerValue(v33, (uint64_t)CFSTR("quiescenceInterval"), 0);
    v10->_engagedUserQuiescenceInterval = FCAppConfigurationIntegerValue(v33, (uint64_t)CFSTR("engagedUserQuiescenceInterval"), 0);
    v22 = [FCEmailSignupConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v33, (uint64_t)CFSTR("emailSignupConfiguration"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[FCEmailSignupConfig initWithConfigDictionary:](v22, "initWithConfigDictionary:", v23);
    emailSignupConfiguration = v10->_emailSignupConfiguration;
    v10->_emailSignupConfiguration = (FCEmailSignupConfig *)v24;

    FCAppConfigurationDictionaryValueWithDefaultValue(v33, (uint64_t)CFSTR("hideMyEmailSignupConfiguration"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = -[FCHideMyEmailSignupConfig initWithConfigDictionary:]([FCHideMyEmailSignupConfig alloc], "initWithConfigDictionary:", v26);
      hideMyEmailSignupConfiguration = v10->_hideMyEmailSignupConfiguration;
      v10->_hideMyEmailSignupConfiguration = v27;

    }
    FCAppConfigurationDictionaryValueWithDefaultValue(v33, (uint64_t)CFSTR("siwaPurchaseConfiguration"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = -[FCSIWAPurchaseConfig initWithConfigDictionary:]([FCSIWAPurchaseConfig alloc], "initWithConfigDictionary:", v29);
      siwaPurchaseConfiguration = v10->_siwaPurchaseConfiguration;
      v10->_siwaPurchaseConfiguration = v30;

    }
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideMyEmailSignupConfiguration, 0);
  objc_storeStrong((id *)&self->_siwaPurchaseConfiguration, 0);
  objc_storeStrong((id *)&self->_emailSignupConfiguration, 0);
  objc_storeStrong((id *)&self->_triggersByMethod, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)triggersByMethod
{
  return self->_triggersByMethod;
}

- (void)setTriggersByMethod:(id)a3
{
  objc_storeStrong((id *)&self->_triggersByMethod, a3);
}

- (int64_t)presentationCap
{
  return self->_presentationCap;
}

- (void)setPresentationCap:(int64_t)a3
{
  self->_presentationCap = a3;
}

- (int64_t)presentationCountResetInterval
{
  return self->_presentationCountResetInterval;
}

- (void)setPresentationCountResetInterval:(int64_t)a3
{
  self->_presentationCountResetInterval = a3;
}

- (int64_t)quiescenceInterval
{
  return self->_quiescenceInterval;
}

- (void)setQuiescenceInterval:(int64_t)a3
{
  self->_quiescenceInterval = a3;
}

- (int64_t)engagedUserQuiescenceInterval
{
  return self->_engagedUserQuiescenceInterval;
}

- (void)setEngagedUserQuiescenceInterval:(int64_t)a3
{
  self->_engagedUserQuiescenceInterval = a3;
}

- (FCEmailSignupConfig)emailSignupConfiguration
{
  return self->_emailSignupConfiguration;
}

- (void)setEmailSignupConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_emailSignupConfiguration, a3);
}

- (FCSIWAPurchaseConfig)siwaPurchaseConfiguration
{
  return self->_siwaPurchaseConfiguration;
}

- (void)setSiwaPurchaseConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_siwaPurchaseConfiguration, a3);
}

- (FCHideMyEmailSignupConfig)hideMyEmailSignupConfiguration
{
  return self->_hideMyEmailSignupConfiguration;
}

- (void)setHideMyEmailSignupConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_hideMyEmailSignupConfiguration, a3);
}

@end
