@implementation DKFollowUp

+ (void)postFollowUp
{
  OUTLINED_FUNCTION_0(&dword_21AC5C000, a2, a3, "Failed to post follow up: %{public}@", a5, a6, a7, a8, 2u);
}

+ (void)clearFollowUp
{
  OUTLINED_FUNCTION_0(&dword_21AC5C000, a2, a3, "Failed to clear follow up: %{public}@", a5, a6, a7, a8, 2u);
}

+ (id)_followUpController
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.disembarkui"));
}

+ (id)_followUpIconName
{
  void *v2;
  void *v3;

  v2 = (void *)MGCopyAnswer();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
