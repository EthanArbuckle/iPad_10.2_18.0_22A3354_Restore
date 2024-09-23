@implementation ICASNoteViewEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("NoteViewEvent");
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
  _QWORD v17[13];
  _QWORD v18[15];

  v18[13] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("noteData");
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v18[0] = v16;
  v17[1] = CFSTR("noteContentData");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v18[1] = v15;
  v17[2] = CFSTR("collapsibleSectionData");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v18[2] = v14;
  v17[3] = CFSTR("noteAccessData");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v18[3] = v13;
  v17[4] = CFSTR("folderData");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v18[4] = v2;
  v17[5] = CFSTR("accountData");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v18[5] = v3;
  v17[6] = CFSTR("orientationData");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v18[6] = v4;
  v17[7] = CFSTR("privateUserData");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v18[7] = v5;
  v17[8] = CFSTR("privateEventData");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v18[8] = v6;
  v17[9] = CFSTR("searchData");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 1);
  v18[9] = v7;
  v17[10] = CFSTR("viewRefData");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 1);
  v18[10] = v8;
  v17[11] = CFSTR("eventData");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v18[11] = v9;
  v17[12] = CFSTR("timedData");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v18[12] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

@end
