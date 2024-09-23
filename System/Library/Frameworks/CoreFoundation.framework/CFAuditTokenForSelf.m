@implementation CFAuditTokenForSelf

uint64_t ___CFAuditTokenForSelf_block_invoke()
{
  mach_msg_type_number_t task_info_outCnt;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  task_info_outCnt = 8;
  return task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)&_CFAuditTokenForSelf_auditToken, &task_info_outCnt);
}

@end
