@implementation CATLogFSM

void ___CATLogFSM_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.catalyst", "FSM");
  v1 = (void *)_CATLogFSM_logObj;
  _CATLogFSM_logObj = (uint64_t)v0;

}

@end
