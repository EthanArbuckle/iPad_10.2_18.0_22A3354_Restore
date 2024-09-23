@implementation BCSDateHelper

- (NSDate)currentDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

@end
