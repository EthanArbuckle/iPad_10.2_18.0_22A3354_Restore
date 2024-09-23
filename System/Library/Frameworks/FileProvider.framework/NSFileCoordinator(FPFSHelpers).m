@implementation NSFileCoordinator(FPFSHelpers)

+ (id)fp_fileCoordinatorForCurrentProcess:()FPFSHelpers
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v12;
  int v13;
  void *v14;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("NSExtension.NSExtensionPointIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    v9 = v4;
    v10 = v3;
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.fileprovider-nonui")))
      goto LABEL_4;
    objc_msgSend(v5, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fp_isiCloudDriveOrCloudDocsIdentifier");

    if (!v13)
    {
      objc_msgSend(v5, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPurposeIdentifier:", v14);

      goto LABEL_4;
    }
    v10 = CFSTR("com.apple.bird");
    v9 = v4;
  }
  objc_msgSend(v9, "setPurposeIdentifier:", v10);
LABEL_4:

  return v4;
}

@end
