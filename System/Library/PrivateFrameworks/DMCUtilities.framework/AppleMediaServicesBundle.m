@implementation AppleMediaServicesBundle

void __AppleMediaServicesBundle_block_invoke()
{
  id v0;

  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/AppleMediaServices.framework"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DMCLazyInitializationUtilities loadNSBundleAtURL:completionBlock:](DMCLazyInitializationUtilities, "loadNSBundleAtURL:completionBlock:", v0, &__block_literal_global_111);

}

void __AppleMediaServicesBundle_block_invoke_2(int a1, int a2, id obj)
{
  objc_storeStrong((id *)&AppleMediaServicesBundle_retval, obj);
}

@end
