@implementation MLLoggingAllowsInstrumentationBasedOnProcess

uint64_t __MLLoggingAllowsInstrumentationBasedOnProcess_block_invoke()
{
  mach_port_name_t *v0;
  uint64_t result;
  int x;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v5;

  *(_OWORD *)task_info_out = 0u;
  v5 = 0u;
  task_info_outCnt = 8;
  v0 = (mach_port_name_t *)MEMORY[0x1E0C83DA0];
  result = task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt);
  x = 0;
  if (!(_DWORD)result)
  {
    result = pid_for_task(*v0, &x);
    if (!(_DWORD)result)
    {
      getpid();
      return csops_audittoken();
    }
  }
  return result;
}

@end
