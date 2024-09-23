@implementation LACLogFaceIDUI

void __LACLogFaceIDUI_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "FaceIDUI");
  v1 = (void *)LACLogFaceIDUI___logObj;
  LACLogFaceIDUI___logObj = (uint64_t)v0;

}

@end
