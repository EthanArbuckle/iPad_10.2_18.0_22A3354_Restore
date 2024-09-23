@implementation NSBundle(PackageMetadata)

- (id)executablePathWithError:()PackageMetadata
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "executablePath");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a3 && !v5)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(a1, "bundlePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithErrno:forFilePath:", 79, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
