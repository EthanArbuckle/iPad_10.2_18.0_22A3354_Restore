@implementation NSString

void __37__NSString_DEURLPathEscaping__escape__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)escape__set;
  escape__set = v0;

}

@end
