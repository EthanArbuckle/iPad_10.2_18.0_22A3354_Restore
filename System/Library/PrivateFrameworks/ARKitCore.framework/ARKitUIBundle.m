@implementation ARKitUIBundle

void __ARKitUIBundle_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.ARKitUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARKitUIBundle_arkitUIBundle;
  ARKitUIBundle_arkitUIBundle = v0;

  if (!ARKitUIBundle_arkitUIBundle)
  {
    v2 = (void *)MEMORY[0x1E0CB34D0];
    _ARSystemLibraryPath();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks/ARKitUI.framework"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleWithPath:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)ARKitUIBundle_arkitUIBundle;
    ARKitUIBundle_arkitUIBundle = v4;

  }
}

@end
