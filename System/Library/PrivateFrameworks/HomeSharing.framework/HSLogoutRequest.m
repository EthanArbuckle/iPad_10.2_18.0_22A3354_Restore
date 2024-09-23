@implementation HSLogoutRequest

- (HSLogoutRequest)init
{
  return -[HSRequest initWithAction:](self, "initWithAction:", CFSTR("logout"));
}

@end
