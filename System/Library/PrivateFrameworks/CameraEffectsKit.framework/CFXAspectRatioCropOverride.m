@implementation CFXAspectRatioCropOverride

void __CFXAspectRatioCropOverride_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CFX_AspectRatioCrop"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CFXAspectRatioCropOverride_aspectRatioCropOverride;
  CFXAspectRatioCropOverride_aspectRatioCropOverride = v0;

}

@end
