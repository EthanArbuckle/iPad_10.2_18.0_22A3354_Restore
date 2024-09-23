@implementation ICASNoteSharrowEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("NoteSharrowEvent");
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
  v3 = objc_msgSend(v2, "initWithName:", CFSTR("jitter"));

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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[14];
  _QWORD v19[16];

  v19[14] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("noteData");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[0] = v17;
  v18[1] = CFSTR("noteContentData");
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[1] = v16;
  v18[2] = CFSTR("folderData");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[2] = v15;
  v18[3] = CFSTR("sharrowContextData");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[3] = v14;
  v18[4] = CFSTR("accountData");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[4] = v13;
  v18[5] = CFSTR("privateUserData");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[5] = v2;
  v18[6] = CFSTR("privateEventData");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[6] = v3;
  v18[7] = CFSTR("contextPathData");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 1);
  v19[7] = v4;
  v18[8] = CFSTR("noteAccessData");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[8] = v5;
  v18[9] = CFSTR("startCollaborationCollaboratorData");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[9] = v6;
  v18[10] = CFSTR("endCollaborationCollaboratorData");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[10] = v7;
  v18[11] = CFSTR("collaboratorData");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[11] = v8;
  v18[12] = CFSTR("shareFlowData");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[12] = v9;
  v18[13] = CFSTR("eventData");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v19[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

@end
