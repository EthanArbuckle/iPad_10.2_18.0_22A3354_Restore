@implementation DAEASBundle

void __DAEASBundle_block_invoke()
{
  id v0;

  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/ExchangeSync.framework/Frameworks/DAEAS.framework"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:completionBlock:](MCLazyInitializationUtilities, "loadNSBundleAtURL:completionBlock:", v0, &__block_literal_global_219);

}

void __DAEASBundle_block_invoke_2(int a1, int a2, id obj)
{
  objc_storeStrong((id *)&DAEASBundle_retval, obj);
}

@end
