@implementation NSError

void __40__NSError_HMFError__hmfUnspecifiedError__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED013138;
  qword_1ED013138 = v0;

}

@end
