@implementation ARLibraryDirectory

void __ARLibraryDirectory_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("ARKit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingString:", CFSTR("/"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)ARLibraryDirectory_arkitLibraryDirectory;
  ARLibraryDirectory_arkitLibraryDirectory = v2;

}

@end
