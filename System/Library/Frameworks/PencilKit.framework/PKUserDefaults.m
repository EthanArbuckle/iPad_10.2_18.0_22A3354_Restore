@implementation PKUserDefaults

void __PKUserDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.PencilKit"));
  v1 = (void *)qword_1ECEE6540;
  qword_1ECEE6540 = v0;

}

@end
