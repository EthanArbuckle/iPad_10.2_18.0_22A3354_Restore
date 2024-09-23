@implementation WDTachycardiaListDataProvider

- (id)_heartEventType
{
  return (id)objc_msgSend(MEMORY[0x24BDD3990], "tachycardiaType");
}

@end
