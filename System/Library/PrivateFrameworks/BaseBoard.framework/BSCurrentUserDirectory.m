@implementation BSCurrentUserDirectory

void __BSCurrentUserDirectory_block_invoke()
{
  id v0;
  uid_t v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0CB3940]);
  v1 = getuid();
  v2 = objc_msgSend(v0, "initWithUTF8String:", getpwuid(v1)->pw_dir);
  v3 = (void *)qword_1ECD39990;
  qword_1ECD39990 = v2;

}

@end
