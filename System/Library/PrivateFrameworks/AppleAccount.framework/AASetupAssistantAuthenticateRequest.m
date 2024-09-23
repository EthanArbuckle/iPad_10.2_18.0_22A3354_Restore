@implementation AASetupAssistantAuthenticateRequest

- (id)urlString
{
  void *v2;
  void *v3;

  +[AASetupAssistantService urlConfiguration](AASetupAssistantService, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authenticateURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
