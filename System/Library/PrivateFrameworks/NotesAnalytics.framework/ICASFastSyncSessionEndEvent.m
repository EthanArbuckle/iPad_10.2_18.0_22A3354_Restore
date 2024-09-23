@implementation ICASFastSyncSessionEndEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("FastSyncSessionEndEvent");
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
  void *v11;
  void *v13;
  _QWORD v14[10];
  _QWORD v15[12];

  v15[10] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("privateUserData");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v15[0] = v13;
  v14[1] = CFSTR("privateEventData");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v15[1] = v2;
  v14[2] = CFSTR("noteData");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v15[2] = v3;
  v14[3] = CFSTR("noteContentData");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v15[3] = v4;
  v14[4] = CFSTR("noteAccessData");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v15[4] = v5;
  v14[5] = CFSTR("fastSyncData");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v15[5] = v6;
  v14[6] = CFSTR("fastSyncParticipantData");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v15[6] = v7;
  v14[7] = CFSTR("fastSyncMessageData");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 1);
  v15[7] = v8;
  v14[8] = CFSTR("fastSyncErrorData");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 1);
  v15[8] = v9;
  v14[9] = CFSTR("eventData");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v15[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

@end
