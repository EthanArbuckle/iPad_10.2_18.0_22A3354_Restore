@implementation AFProcessIsAssistantService

void __AFProcessIsAssistantService_block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("assistant_service"));

  if (v2)
  {
    AFProcessGetValueForEntitlement(CFSTR("application-identifier"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    AFProcessIsAssistantService_isAssistantService = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.assistant_service"));

  }
}

@end
