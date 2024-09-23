@implementation NSProcessInfo(IntentsFoundation)

- (uint64_t)if_auditToken
{
  mach_msg_type_number_t task_info_outCnt;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  task_info_outCnt = 8;
  return task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)a1, &task_info_outCnt);
}

@end
