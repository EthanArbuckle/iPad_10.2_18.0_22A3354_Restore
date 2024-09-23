@implementation AVCaptureGetCurrentProcessAuditToken

uint64_t __AVCaptureGetCurrentProcessAuditToken_block_invoke()
{
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  return task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)&AVCaptureGetCurrentProcessAuditToken_currentProcessAuditToken, &task_info_outCnt);
}

@end
