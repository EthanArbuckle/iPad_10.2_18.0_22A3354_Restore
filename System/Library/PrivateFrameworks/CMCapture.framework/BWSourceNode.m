@implementation BWSourceNode

- (id)nodeType
{
  return CFSTR("Source");
}

- (BOOL)start:(id *)a3
{
  return 1;
}

- (BOOL)stop:(id *)a3
{
  return 1;
}

- (OpaqueCMClock)clock
{
  return 0;
}

@end
