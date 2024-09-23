@implementation ICASFastSyncSessionStartEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("FastSyncSessionStartEvent");
}

+ (AASessionGroup)sessionGroup
{
  return (AASessionGroup *)objc_msgSend(MEMORY[0x1E0CF8728], "default");
}

+ (int64_t)timestampGranularity
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0CF8738], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithName:", CFSTR("day"));

  return v3;
}

- (NSDictionary)eventProperties
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
  _QWORD v12[8];
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("privateUserData");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v13[0] = v2;
  v12[1] = CFSTR("privateEventData");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v13[1] = v3;
  v12[2] = CFSTR("noteData");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v13[2] = v4;
  v12[3] = CFSTR("noteContentData");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v13[3] = v5;
  v12[4] = CFSTR("noteAccessData");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v13[4] = v6;
  v12[5] = CFSTR("fastSyncData");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v13[5] = v7;
  v12[6] = CFSTR("fastSyncParticipantData");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v13[6] = v8;
  v12[7] = CFSTR("eventData");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v13[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

@end
