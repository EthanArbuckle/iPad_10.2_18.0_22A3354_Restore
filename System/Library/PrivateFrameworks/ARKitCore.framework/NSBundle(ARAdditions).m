@implementation NSBundle(ARAdditions)

- (const)ar_pathForPrivateResourceBundlePath
{
  return CFSTR("/AppleInternal/Library/Bundles/ARKitInternalExtras.bundle");
}

- (id)ar_pathForPrivateResource:()ARAdditions ofType:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.ARKitInternalExtras"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    ARKitCoreBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundlePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("ARKitInternalExtras.bundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v13 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(a1, "ar_pathForPrivateResourceBundlePath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleWithPath:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v8, "pathForResource:ofType:", v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
