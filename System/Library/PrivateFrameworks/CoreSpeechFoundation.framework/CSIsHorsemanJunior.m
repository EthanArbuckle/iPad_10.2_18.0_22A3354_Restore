@implementation CSIsHorsemanJunior

unint64_t __CSIsHorsemanJunior_block_invoke()
{
  unint64_t result;

  result = +[CSUtils horsemanDeviceType](CSUtils, "horsemanDeviceType");
  CSIsHorsemanJunior_isHorsemanJunior = result == 2;
  return result;
}

@end
