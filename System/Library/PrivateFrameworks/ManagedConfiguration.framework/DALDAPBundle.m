@implementation DALDAPBundle

void __DALDAPBundle_block_invoke()
{
  id v0;

  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DALDAP.framework"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:completionBlock:](MCLazyInitializationUtilities, "loadNSBundleAtURL:completionBlock:", v0, &__block_literal_global_221);

}

void __DALDAPBundle_block_invoke_2(int a1, int a2, id obj)
{
  objc_storeStrong((id *)&DALDAPBundle_retval, obj);
}

@end
