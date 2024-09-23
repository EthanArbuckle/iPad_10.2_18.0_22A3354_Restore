@implementation NTKPhotosCanEncodeHEIC

void __NTKPhotosCanEncodeHEIC_block_invoke()
{
  void *v0;
  CFArrayRef v1;

  v1 = CGImageDestinationCopyTypeIdentifiers();
  objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  NTKPhotosCanEncodeHEIC_isSupported = -[__CFArray containsObject:](v1, "containsObject:", v0);

}

@end
