@implementation CPCanSendMail

void __CPCanSendMail_block_invoke()
{
  void *v0;

  if (CPSystemRootDirectory_onceToken != -1)
    dispatch_once(&CPSystemRootDirectory_onceToken, &__block_literal_global_7);
  v0 = dlopen((const char *)objc_msgSend((id)objc_msgSend((id)CPSystemRootDirectory_systemRootDirectory, "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/MailServices.framework/MailServices")), "fileSystemRepresentation"), 5);
  if (v0)
    CPCanSendMail_MailServicesCanSendMail = (uint64_t (*)(void))dlsym(v0, "MSCanSendMail");
  else
    NSLog((NSString *)CFSTR("failed to load MailServices framework"));
}

@end
