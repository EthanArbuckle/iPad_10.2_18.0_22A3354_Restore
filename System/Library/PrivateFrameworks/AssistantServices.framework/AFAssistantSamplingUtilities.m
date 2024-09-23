@implementation AFAssistantSamplingUtilities

+ (id)component
{
  return CFSTR("Assistant");
}

+ (id)sampledSubDirectoryPath
{
  return CFSTR("/Assistant/AssistantSampled");
}

+ (id)sampledCachesSubDirectoryPath
{
  return CFSTR("com.apple.assistantd/AssistantSampled");
}

+ (id)samplingDateAsString
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
