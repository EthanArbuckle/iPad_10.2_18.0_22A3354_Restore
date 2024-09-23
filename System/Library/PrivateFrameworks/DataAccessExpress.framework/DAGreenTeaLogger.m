@implementation DAGreenTeaLogger

uint64_t __DAGreenTeaLogger_block_invoke()
{
  uint64_t result;

  result = ct_green_tea_logger_create();
  DAGreenTeaLogger_greenTeaLogger = result;
  return result;
}

@end
