@implementation BEUtil

uint64_t __38___BEUtil_auditTokenForCurrentProcess__block_invoke()
{
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  return task_info(*MEMORY[0x24BDAEC58], 0xFu, auditTokenForCurrentProcess_currentAuditToken, &task_info_outCnt);
}

@end
