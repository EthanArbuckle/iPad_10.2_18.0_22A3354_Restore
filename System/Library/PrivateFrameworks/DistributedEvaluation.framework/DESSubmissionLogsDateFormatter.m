@implementation DESSubmissionLogsDateFormatter

uint64_t __DESSubmissionLogsDateFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)DESSubmissionLogsDateFormatter_formatter;
  DESSubmissionLogsDateFormatter_formatter = (uint64_t)v0;

  return objc_msgSend((id)DESSubmissionLogsDateFormatter_formatter, "setDateFormat:", CFSTR("YYYYMMdd'T'HHmmss"));
}

@end
