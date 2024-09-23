@implementation HSServerInfoRequest

- (HSServerInfoRequest)init
{
  return -[HSRequest initWithAction:](self, "initWithAction:", CFSTR("server-info"));
}

@end
