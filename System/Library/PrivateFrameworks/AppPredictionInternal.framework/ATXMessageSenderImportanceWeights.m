@implementation ATXMessageSenderImportanceWeights

- (ATXMessageSenderImportanceWeights)init
{
  ATXMessageSenderImportanceWeights *v2;
  uint64_t v3;
  NSDictionary *messageSenderImportanceWeights;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXMessageSenderImportanceWeights;
  v2 = -[ATXMessageSenderImportanceWeights init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForResource:ofType:specifiedABGroup:", CFSTR("ATXMessageSenderImportance"), CFSTR("plist"), 0);
    v3 = objc_claimAutoreleasedReturnValue();
    messageSenderImportanceWeights = v2->_messageSenderImportanceWeights;
    v2->_messageSenderImportanceWeights = (NSDictionary *)v3;

  }
  return v2;
}

- (double)isiCloudFamilyMember
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_messageSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("isiCloudFamilyMember"));
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

- (double)isEmergencyContact
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_messageSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("isEmergencyContact"));
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

- (double)isFavoriteContact
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_messageSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("isFavoriteContact"));
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

- (double)isVIP
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_messageSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("isVIP"));
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

- (double)isAudioMessage
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_messageSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("isAudioMessage"));
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

- (double)isContactChatPinnedInMessage
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_messageSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("isContactChatPinnedInMessage"));
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

- (double)isMentionedInGroupMessage
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_messageSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("isMentionedInGroupMessage"));
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

- (double)isFrequentlyContacted
{
  void *v2;
  void *v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_messageSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("isFrequentlyContacted"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (double)(int)objc_msgSend(v2, "intValue");
  else
    v4 = 0.25;

  return v4;
}

- (double)contactHasBeencontactedToday
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_messageSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("contactedToday"));
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

- (double)speedOfResponseToMessageContact
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_messageSenderImportanceWeights, "objectForKeyedSubscript:", CFSTR("speedOfResponse"));
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
  objc_storeStrong((id *)&self->_messageSenderImportanceWeights, 0);
}

@end
