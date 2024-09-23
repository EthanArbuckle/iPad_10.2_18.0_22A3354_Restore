@implementation HMBMutableAction

- (id)copyWithZone:(_NSZone *)a3
{
  HMBAction *v4;

  v4 = -[HMBAction init](+[HMBAction allocWithZone:](HMBAction, "allocWithZone:", a3), "init");
  -[HMBAction setShouldUpdateClients:](v4, "setShouldUpdateClients:", -[HMBAction shouldUpdateClients](self, "shouldUpdateClients"));
  return v4;
}

@end
