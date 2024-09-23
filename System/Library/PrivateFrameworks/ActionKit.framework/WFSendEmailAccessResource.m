@implementation WFSendEmailAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)associatedAppIdentifier
{
  return (id)*MEMORY[0x24BEC16E0];
}

- (unint64_t)status
{
  return 4;
}

@end
