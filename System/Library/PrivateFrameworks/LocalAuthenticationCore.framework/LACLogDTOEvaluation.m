@implementation LACLogDTOEvaluation

void __LACLogDTOEvaluation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "DTO_Evaluation");
  v1 = (void *)LACLogDTOEvaluation___logObj;
  LACLogDTOEvaluation___logObj = (uint64_t)v0;

}

@end
