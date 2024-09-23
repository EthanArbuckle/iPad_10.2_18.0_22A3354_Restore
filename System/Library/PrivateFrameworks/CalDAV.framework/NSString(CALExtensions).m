@implementation NSString(CALExtensions)

+ (id)ellipsisString
{
  __int16 v1;

  v1 = 8230;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
