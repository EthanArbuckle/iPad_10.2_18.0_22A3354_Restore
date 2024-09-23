@implementation GetShortDateFormatterQueue

dispatch_queue_t __GetShortDateFormatterQueue_block_invoke(uint64_t a1)
{
  dispatch_queue_t result;

  result = dispatch_queue_create("Date Formatting", 0);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
