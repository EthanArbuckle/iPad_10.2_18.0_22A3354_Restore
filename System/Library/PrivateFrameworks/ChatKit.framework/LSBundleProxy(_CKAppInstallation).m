@implementation LSBundleProxy(_CKAppInstallation)

- (id)__ck_icon
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:", a1, 14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:", a1, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
