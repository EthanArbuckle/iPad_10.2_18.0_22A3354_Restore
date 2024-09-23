@implementation UTSetRuntimeIssueCatcher

uint64_t (*___UTSetRuntimeIssueCatcher_block_invoke())(_QWORD)
{
  uint64_t (*result)(_QWORD);

  result = (uint64_t (*)(_QWORD))os_log_set_fault_callback();
  off_1ECD26CB0 = result;
  return result;
}

@end
