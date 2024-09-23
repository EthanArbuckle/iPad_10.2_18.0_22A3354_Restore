@implementation ICASAttachmentSnapshotEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("AttachmentSnapshotEvent");
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
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("attachmentSnapshotData");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v6[1] = CFSTR("eventData");
  v7[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8708]), "initWithDataType:requirement:", objc_opt_class(), 0);
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

@end
