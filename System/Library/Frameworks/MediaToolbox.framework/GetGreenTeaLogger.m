@implementation GetGreenTeaLogger

uint64_t __playerairplay_GetGreenTeaLogger_block_invoke()
{
  uint64_t result;

  result = ct_green_tea_logger_create();
  playerairplay_GetGreenTeaLogger_greenTeaLogger = result;
  return result;
}

@end
