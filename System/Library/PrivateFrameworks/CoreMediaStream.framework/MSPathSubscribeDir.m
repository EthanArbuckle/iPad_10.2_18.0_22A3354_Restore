@implementation MSPathSubscribeDir

void __MSPathSubscribeDir_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  MSPlatform();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathMediaStreamDir");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("sub"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)MSPathSubscribeDir_path;
  MSPathSubscribeDir_path = v1;

}

@end
