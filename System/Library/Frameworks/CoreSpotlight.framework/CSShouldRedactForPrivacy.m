@implementation CSShouldRedactForPrivacy

void __CSShouldRedactForPrivacy_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  CSShouldRedactForPrivacy_shouldObfuscate = objc_msgSend(v0, "BOOLForKey:", CFSTR("com.apple.corespotlight.log-sensitive-data")) ^ 1;

}

@end
