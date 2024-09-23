@implementation WDBradycardiaListDataProvider

- (id)_heartEventType
{
  return (id)objc_msgSend(MEMORY[0x24BDD3990], "bradycardiaType");
}

@end
