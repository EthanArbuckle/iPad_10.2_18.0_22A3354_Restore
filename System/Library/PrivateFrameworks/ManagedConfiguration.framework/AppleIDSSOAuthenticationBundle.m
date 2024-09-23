@implementation AppleIDSSOAuthenticationBundle

void __AppleIDSSOAuthenticationBundle_block_invoke()
{
  id v0;

  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/AppleIDSSOAuthentication.framework"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:completionBlock:](MCLazyInitializationUtilities, "loadNSBundleAtURL:completionBlock:", v0, &__block_literal_global_223);

}

void __AppleIDSSOAuthenticationBundle_block_invoke_2(int a1, int a2, id obj)
{
  objc_storeStrong((id *)&AppleIDSSOAuthenticationBundle_retval, obj);
}

@end
