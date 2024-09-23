@implementation ATXSenderImportanceSuggestionThreshold

- (ATXSenderImportanceSuggestionThreshold)init
{
  ATXSenderImportanceSuggestionThreshold *v2;
  uint64_t v3;
  NSDictionary *senderImportanceSuggestionThreshold;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXSenderImportanceSuggestionThreshold;
  v2 = -[ATXSenderImportanceSuggestionThreshold init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForResource:ofType:specifiedABGroup:", CFSTR("ATXSenderImportanceSuggestionThreshold"), CFSTR("plist"), 0);
    v3 = objc_claimAutoreleasedReturnValue();
    senderImportanceSuggestionThreshold = v2->_senderImportanceSuggestionThreshold;
    v2->_senderImportanceSuggestionThreshold = (NSDictionary *)v3;

  }
  return v2;
}

- (double)mailSenderImportanceThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_senderImportanceSuggestionThreshold, "objectForKeyedSubscript:", CFSTR("mailSenderImportanceThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.5;
  }

  return v5;
}

- (double)messageSenderImportanceThreshold
{
  void *v2;
  void *v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_senderImportanceSuggestionThreshold, "objectForKeyedSubscript:", CFSTR("messageSenderImportanceThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (double)(int)objc_msgSend(v2, "intValue");
  else
    v4 = 0.5;

  return v4;
}

- (double)notificationSenderImportanceThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_senderImportanceSuggestionThreshold, "objectForKeyedSubscript:", CFSTR("notificationSenderImportanceThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderImportanceSuggestionThreshold, 0);
}

@end
