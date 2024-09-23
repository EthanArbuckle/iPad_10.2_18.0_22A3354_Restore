@implementation ARKitBundle

void __ARKitBundle_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.ARKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARKitBundle_arkitBundle;
  ARKitBundle_arkitBundle = v0;

  if (!ARKitBundle_arkitBundle)
  {
    v2 = (void *)MEMORY[0x1E0CB34D0];
    _ARSystemLibraryPath();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Frameworks/ARKit.framework"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleWithPath:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)ARKitBundle_arkitBundle;
    ARKitBundle_arkitBundle = v4;

  }
}

@end
