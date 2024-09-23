@implementation ATXNotificationSenderImportanceWeights

- (ATXNotificationSenderImportanceWeights)init
{
  ATXNotificationSenderImportanceWeights *v2;
  uint64_t v3;
  NSDictionary *notificationSenderImportanceWeights;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXNotificationSenderImportanceWeights;
  v2 = -[ATXNotificationSenderImportanceWeights init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForResource:ofType:specifiedABGroup:", CFSTR("ATXNotificationSenderImportance"), CFSTR("plist"), 0);
    v3 = objc_claimAutoreleasedReturnValue();
    notificationSenderImportanceWeights = v2->_notificationSenderImportanceWeights;
    v2->_notificationSenderImportanceWeights = (NSDictionary *)v3;

  }
  return v2;
}

- (double)interactedWithNotificationToday
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("interactedWithToday"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.25;
  }

  return v5;
}

- (double)speedOfResponseToNotification
{
  void *v2;
  void *v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("speedOfResponse"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (double)(int)objc_msgSend(v2, "intValue");
  else
    v4 = 0.5;

  return v4;
}

- (double)frequencyOfInteractionWithNotification
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("frequencyOfInteraction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.25;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSenderImportanceWeights, 0);
}

@end
