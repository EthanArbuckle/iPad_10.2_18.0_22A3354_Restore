@implementation AASetupAssistantUpdateRequest

- (id)urlString
{
  void *v2;
  void *v3;

  +[AASetupAssistantService urlConfiguration](AASetupAssistantService, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAppleIDURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
