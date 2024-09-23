@implementation FCChannelUpsellTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonSubscriberUpsellArticleID, 0);
  objc_storeStrong((id *)&self->_subscriberUpsellArticleID, 0);
}

- (unint64_t)triggerMethod
{
  return self->_triggerMethod;
}

- (FCChannelUpsellTrigger)initWithConfigDictionary:(id)a3
{
  id v4;
  FCChannelUpsellTrigger *v5;
  void *v6;
  uint64_t v7;
  NSString *subscriberUpsellArticleID;
  uint64_t v9;
  NSString *nonSubscriberUpsellArticleID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCChannelUpsellTrigger;
  v5 = -[FCChannelUpsellTrigger init](&v12, sel_init);
  if (v5)
  {
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("triggerMethod"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_triggerMethod = FCChannelUpsellTriggerMethodForValue(v6);

    v5->_triggerCount = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("triggerCount"), 0);
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("subscriberUpsellArticleID"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    subscriberUpsellArticleID = v5->_subscriberUpsellArticleID;
    v5->_subscriberUpsellArticleID = (NSString *)v7;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("nonSubscriberUpsellArticleID"), 0);
    v9 = objc_claimAutoreleasedReturnValue();
    nonSubscriberUpsellArticleID = v5->_nonSubscriberUpsellArticleID;
    v5->_nonSubscriberUpsellArticleID = (NSString *)v9;

  }
  return v5;
}

- (void)setTriggerMethod:(unint64_t)a3
{
  self->_triggerMethod = a3;
}

- (int64_t)triggerCount
{
  return self->_triggerCount;
}

- (void)setTriggerCount:(int64_t)a3
{
  self->_triggerCount = a3;
}

- (NSString)subscriberUpsellArticleID
{
  return self->_subscriberUpsellArticleID;
}

- (void)setSubscriberUpsellArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)nonSubscriberUpsellArticleID
{
  return self->_nonSubscriberUpsellArticleID;
}

- (void)setNonSubscriberUpsellArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
