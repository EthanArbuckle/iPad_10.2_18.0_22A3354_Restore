@implementation RoundToScale

uint64_t __RoundToScale_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
  RoundToScale___s = v1;
  return result;
}

@end
