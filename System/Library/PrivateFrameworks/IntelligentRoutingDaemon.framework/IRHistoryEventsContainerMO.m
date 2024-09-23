@implementation IRHistoryEventsContainerMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRHistoryEventsContainerMO"));
}

@end
