@implementation MRMediaRemoteApplicationIsSystemBooksApplication

void __MRMediaRemoteApplicationIsSystemBooksApplication_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.NanoBooks"), CFSTR("com.apple.TVBooks"), CFSTR("com.apple.iBooksX"), CFSTR("com.apple.iBooks"), CFSTR("(System Books Application)"), 0);
  v1 = (void *)MRMediaRemoteApplicationIsSystemBooksApplication___allKnownSystemBooksApplications;
  MRMediaRemoteApplicationIsSystemBooksApplication___allKnownSystemBooksApplications = v0;

}

@end
