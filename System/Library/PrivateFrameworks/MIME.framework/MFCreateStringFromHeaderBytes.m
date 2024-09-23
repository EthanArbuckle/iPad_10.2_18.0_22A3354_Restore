@implementation MFCreateStringFromHeaderBytes

void ___MFCreateStringFromHeaderBytes_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("\\=\\?([^?]*)\\?(q|b)\\?([^?]*)\\?\\="), 1, 0);
  v1 = (void *)_MFCreateStringFromHeaderBytes_mimeRegex;
  _MFCreateStringFromHeaderBytes_mimeRegex = v0;

}

@end
