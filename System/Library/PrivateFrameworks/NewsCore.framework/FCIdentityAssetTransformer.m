@implementation FCIdentityAssetTransformer

+ (id)sharedInstance
{
  if (qword_1ED0F80D0 != -1)
    dispatch_once(&qword_1ED0F80D0, &__block_literal_global_63);
  return (id)_MergedGlobals_162;
}

void __44__FCIdentityAssetTransformer_sharedInstance__block_invoke()
{
  FCIdentityAssetTransformer *v0;
  void *v1;

  v0 = objc_alloc_init(FCIdentityAssetTransformer);
  v1 = (void *)_MergedGlobals_162;
  _MergedGlobals_162 = (uint64_t)v0;

}

- (BOOL)transformAssetDataFromFilePath:(id)a3 toFilePath:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x1E0CB3620];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v11, v12, a5);
  return (char)a5;
}

@end
