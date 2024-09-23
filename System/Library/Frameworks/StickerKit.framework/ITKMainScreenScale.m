@implementation ITKMainScreenScale

uint64_t __ITKMainScreenScale_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen"), "scale");
  ITKMainScreenScale_sMainScreenScale = v1;
  return result;
}

uint64_t __ITKMainScreenScale_block_invoke_0()
{
  uint64_t result;
  uint64_t v1;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen"), "scale");
  ITKMainScreenScale_sMainScreenScale_0 = v1;
  return result;
}

@end
