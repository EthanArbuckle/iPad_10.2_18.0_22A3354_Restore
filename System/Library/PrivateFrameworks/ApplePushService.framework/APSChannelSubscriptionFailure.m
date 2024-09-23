@implementation APSChannelSubscriptionFailure

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[APSChannelSubscriptionFailure pushTopic](self, "pushTopic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSChannelSubscriptionFailure channelID](self, "channelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("pushTopic %@ channelID %@ failureReason %d"), v4, v5, -[APSChannelSubscriptionFailure failureReason](self, "failureReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
  objc_storeStrong((id *)&self->_pushTopic, a3);
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
  objc_storeStrong((id *)&self->_channelID, a3);
}

- (int)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(int)a3
{
  self->_failureReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
}

@end
